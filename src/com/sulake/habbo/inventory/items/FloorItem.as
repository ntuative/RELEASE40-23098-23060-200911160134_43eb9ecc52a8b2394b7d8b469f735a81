package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_1287:String;
      
      protected var var_2128:Boolean;
      
      protected var var_2070:int;
      
      protected var _type:int;
      
      protected var var_2073:int;
      
      protected var var_2131:Boolean;
      
      protected var var_1633:int;
      
      protected var var_2129:Boolean;
      
      protected var _id:int;
      
      protected var var_2130:int;
      
      protected var var_1702:String;
      
      protected var var_2074:Boolean;
      
      protected var _category:int;
      
      protected var var_2067:int;
      
      protected var var_2132:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:int, param11:int, param12:int, param13:String, param14:int)
      {
         super();
         _id = param1;
         _type = param2;
         var_2130 = param3;
         _category = param4;
         var_2074 = param5;
         var_2129 = param6;
         var_2128 = param7;
         var_1287 = param8;
         var_2132 = param9;
         var_2070 = param10;
         var_2067 = param11;
         var_2073 = param12;
         var_1702 = param13;
         var_1633 = param14;
      }
      
      public function get locked() : Boolean
      {
         return var_2131;
      }
      
      public function get songId() : int
      {
         return var_1633;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2131 = param1;
      }
      
      public function get ref() : int
      {
         return var_2130;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get slotId() : String
      {
         return var_1702;
      }
      
      public function get expires() : int
      {
         return var_2132;
      }
      
      public function get creationYear() : int
      {
         return var_2073;
      }
      
      public function get creationDay() : int
      {
         return var_2070;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2129;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get groupable() : Boolean
      {
         return var_2074;
      }
      
      public function get creationMonth() : int
      {
         return var_2067;
      }
      
      public function get extras() : String
      {
         return var_1287;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2128;
      }
   }
}
