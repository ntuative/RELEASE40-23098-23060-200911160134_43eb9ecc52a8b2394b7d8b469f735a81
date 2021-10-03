package com.sulake.room.object
{
   import flash.utils.Dictionary;
   
   public class RoomObjectModel implements IRoomObjectModelController
   {
       
      
      private var _updateID:uint;
      
      private var _stringArrayReadOnlyList:Array;
      
      private var _numberArrayReadOnlyList:Array;
      
      private var var_417:Dictionary;
      
      private var var_419:Dictionary;
      
      private var var_880:Array;
      
      private var var_418:Dictionary;
      
      private var var_879:Array;
      
      private var var_420:Dictionary;
      
      public function RoomObjectModel()
      {
         super();
         var_418 = new Dictionary();
         var_420 = new Dictionary();
         var_419 = new Dictionary();
         var_417 = new Dictionary();
         var_880 = [];
         var_879 = [];
         _numberArrayReadOnlyList = [];
         _stringArrayReadOnlyList = [];
         _updateID = 0;
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(var_880.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_880.push(param1);
         }
         if(var_418[param1] != param2)
         {
            var_418[param1] = param2;
            ++_updateID;
         }
      }
      
      public function setStringArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(_stringArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            _stringArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is String)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = var_417[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as String != _loc6_[_loc5_] as String)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         var_417[param1] = _loc4_;
         ++_updateID;
      }
      
      public function getNumber(param1:String) : Number
      {
         return var_418[param1];
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(var_879.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_879.push(param1);
         }
         if(var_420[param1] != param2)
         {
            var_420[param1] = param2;
            ++_updateID;
         }
      }
      
      public function setNumberArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(_numberArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            _numberArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is Number)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = var_419[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as Number != _loc6_[_loc5_] as Number)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         var_419[param1] = _loc4_;
         ++_updateID;
      }
      
      public function getString(param1:String) : String
      {
         return var_420[param1];
      }
      
      public function getNumberArray(param1:String) : Array
      {
         var _loc2_:Array = var_419[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_418 != null)
         {
            for(_loc1_ in var_418)
            {
               delete var_418[_loc1_];
            }
            var_418 = null;
         }
         if(var_420 != null)
         {
            for(_loc1_ in var_420)
            {
               delete var_420[_loc1_];
            }
            var_420 = null;
         }
         if(var_419 != null)
         {
            for(_loc1_ in var_419)
            {
               delete var_419[_loc1_];
            }
            var_419 = null;
         }
         if(var_417 != null)
         {
            for(_loc1_ in var_417)
            {
               delete var_417[_loc1_];
            }
            var_417 = null;
         }
         var_879 = [];
         var_880 = [];
         _stringArrayReadOnlyList = [];
         _numberArrayReadOnlyList = [];
      }
      
      public function getStringArray(param1:String) : Array
      {
         var _loc2_:Array = var_417[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
   }
}
