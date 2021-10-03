package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_813:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1222:Boolean = true;
      
      private var var_1234:int = 0;
      
      private var var_786:int = 0;
      
      private var var_1172:int = 0;
      
      private var var_787:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1233:int = 15;
      
      private var var_178:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1232:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1172 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1222)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_786,var_787);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1234;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_786 == 0 && var_787 == 0;
      }
      
      private function resetLog() : void
      {
         var_786 = 0;
         var_787 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1222)
         {
            return;
         }
         if(getTimer() - var_1172 > var_1232 * 1000 && var_1234 < var_1233)
         {
            var_1172 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1232 = int(var_178.getKey("lagwarninglog.interval","60"));
         var_1233 = int(var_178.getKey("lagwarninglog.reportlimit","15"));
         var_1222 = Boolean(int(var_178.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_787 += 1;
            case const_813:
               var_786 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
