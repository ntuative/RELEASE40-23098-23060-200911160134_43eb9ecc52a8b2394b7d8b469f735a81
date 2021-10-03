package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.tracking.statistics.DiscreteDistribution;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1235:int = 1000;
      
      private var var_1467:GarbageMonitor = null;
      
      private var var_1172:int = 0;
      
      private var var_1244:Boolean = false;
      
      private var var_2019:String = "";
      
      private var var_1466:String = "";
      
      private var var_402:Number = 0;
      
      private var var_1233:int = 10;
      
      private var var_2190:Array;
      
      private var var_573:int = 0;
      
      private var var_1232:int = 60;
      
      private var var_992:int = 0;
      
      private var var_993:int = 0;
      
      private var var_2047:String = "";
      
      private var var_2021:Boolean = true;
      
      private var var_2020:Number = 0.15;
      
      private var var_178:IHabboConfigurationManager = null;
      
      private var var_829:DiscreteDistribution = null;
      
      private var var_2018:String = "";
      
      private var var_1234:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2190 = [];
         super();
         var_1466 = Capabilities.version;
         var_2019 = Capabilities.os;
         var_1244 = Capabilities.isDebugger;
         var_2018 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1467 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1172 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1467.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1467.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_402;
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1232 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1466;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_993;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1235)
         {
            ++var_992;
            _loc3_ = true;
         }
         else
         {
            ++var_573;
            if(var_573 <= 1)
            {
               var_402 = param1;
            }
            else
            {
               _loc4_ = Number(var_573);
               var_402 = var_402 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1172 > var_1232 * 1000 && var_1234 < var_1233)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_402);
            _loc5_ = true;
            if(var_2021 && var_829 != null)
            {
               if(var_1234 > 0)
               {
                  var_829.addDataPoint(1000 / var_402);
                  Logger.log("**** Average frame rate square-root of variance undefined");
                  _loc6_ = 0 / 0;
                  if(_loc6_ < var_2020)
                  {
                     _loc5_ = false;
                  }
               }
            }
            var_1172 = getTimer();
            if(_loc5_ || _loc3_)
            {
               if(sendReport())
               {
                  ++var_1234;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1233 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1235 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2018,var_1466,var_2019,var_2047,var_1244,_loc4_,_loc3_,var_993,var_402,var_992);
            _connection.send(_loc1_);
            var_993 = 0;
            var_402 = 0;
            var_573 = 0;
            var_992 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1232 = int(var_178.getKey("performancetest.interval","60"));
         var_1235 = int(var_178.getKey("performancetest.slowupdatelimit","1000"));
         var_1233 = int(var_178.getKey("performancetest.reportlimit","10"));
         var _loc2_:int = int(var_178.getKey("performancetest.distribution.samples","5"));
         var_829 = new DiscreteDistribution(_loc2_);
         var_2020 = Number(var_178.getKey("performancetest.distribution.deviancelimit.percent","10")) / 100;
         var_2021 = Boolean(int(var_178.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
