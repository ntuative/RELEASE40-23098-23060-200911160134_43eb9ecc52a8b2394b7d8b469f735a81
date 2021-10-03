package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      private var var_216:int = 0;
      
      private var var_1541:int = 0;
      
      private var var_2028:Number = 0;
      
      private var var_2032:Number = 0;
      
      private var var_2029:Number = 0;
      
      private var var_2031:Number = 0;
      
      private var var_2030:Boolean = false;
      
      private var var_90:Number = 0;
      
      private var _id:int = 0;
      
      private var var_200:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_200 = [];
         super();
         _id = param1;
         var_90 = param2;
         _y = param3;
         var_89 = param4;
         var_2031 = param5;
         var_216 = param6;
         var_1541 = param7;
         var_2028 = param8;
         var_2032 = param9;
         var_2029 = param10;
         var_2030 = param11;
         var_200 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get dir() : int
      {
         return var_216;
      }
      
      public function get localZ() : Number
      {
         return var_2031;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2030;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1541;
      }
      
      public function get targetX() : Number
      {
         return var_2028;
      }
      
      public function get targetY() : Number
      {
         return var_2032;
      }
      
      public function get targetZ() : Number
      {
         return var_2029;
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      public function get actions() : Array
      {
         return var_200.slice();
      }
   }
}
