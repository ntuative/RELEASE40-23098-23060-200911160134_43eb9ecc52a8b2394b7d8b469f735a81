package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2070:int;
      
      private var var_2072:int;
      
      private var var_979:String;
      
      private var var_1732:int;
      
      private var var_2068:String;
      
      private var var_2069:int;
      
      private var var_2073:int;
      
      private var _category:int;
      
      private var var_2075:int;
      
      private var var_2067:int;
      
      private var var_2071:int;
      
      private var var_2074:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1732 = param1;
         var_979 = param2;
         var_2072 = param3;
         var_2071 = param4;
         _category = param5;
         var_2068 = param6;
         var_2069 = param7;
         var_2070 = param8;
         var_2067 = param9;
         var_2073 = param10;
         var_2074 = param11;
         var_2075 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2071;
      }
      
      public function get groupable() : Boolean
      {
         return var_2074;
      }
      
      public function get creationMonth() : int
      {
         return var_2067;
      }
      
      public function get roomItemID() : int
      {
         return var_2072;
      }
      
      public function get itemType() : String
      {
         return var_979;
      }
      
      public function get itemID() : int
      {
         return var_1732;
      }
      
      public function get itemSpecificData() : String
      {
         return var_2068;
      }
      
      public function get songID() : int
      {
         return var_2075;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2069;
      }
      
      public function get creationYear() : int
      {
         return var_2073;
      }
      
      public function get creationDay() : int
      {
         return var_2070;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
