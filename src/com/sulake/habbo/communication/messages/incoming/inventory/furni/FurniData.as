package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1705:String;
      
      private var var_979:String;
      
      private var var_1704:Boolean;
      
      private var var_1584:int;
      
      private var var_1707:Boolean;
      
      private var var_1702:String = "";
      
      private var _category:int;
      
      private var var_1251:int;
      
      private var var_1703:Boolean;
      
      private var var_1633:int = -1;
      
      private var _objId:int;
      
      private var var_1706:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:int)
      {
         super();
         var_1584 = param1;
         var_979 = param2;
         _objId = param3;
         var_1251 = param4;
         _category = param5;
         var_1705 = param6;
         var_1704 = param7;
         var_1707 = param8;
         var_1703 = param9;
         var_1706 = param10;
      }
      
      public function get classId() : int
      {
         return var_1251;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1704;
      }
      
      public function get stripId() : int
      {
         return var_1584;
      }
      
      public function get stuffData() : String
      {
         return var_1705;
      }
      
      public function get songId() : int
      {
         return var_1633;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1702 = param1;
         var_1633 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1706;
      }
      
      public function get itemType() : String
      {
         return var_979;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get slotId() : String
      {
         return var_1702;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1703;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1707;
      }
   }
}
