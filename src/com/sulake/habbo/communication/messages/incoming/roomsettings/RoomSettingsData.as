package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_443:int = 0;
      
      public static const const_102:int = 2;
      
      public static const const_147:int = 1;
      
      public static const const_524:Array = ["open","closed","password"];
       
      
      private var var_2011:int;
      
      private var var_2012:int;
      
      private var var_1534:Array;
      
      private var var_1538:Boolean;
      
      private var var_1037:String;
      
      private var var_1535:Boolean;
      
      private var var_1533:int;
      
      private var var_1536:int;
      
      private var var_1132:int;
      
      private var var_1537:Boolean;
      
      private var _roomId:int;
      
      private var var_1539:Boolean;
      
      private var _name:String;
      
      private var var_571:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1533;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1533 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1538;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1539;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2011 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1534 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1539 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_571 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2012;
      }
      
      public function get categoryId() : int
      {
         return var_1132;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1538 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1537 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1535 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_2011;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1534;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1537;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1535;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1536 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2012 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1536;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1132 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1037 = param1;
      }
      
      public function get description() : String
      {
         return var_1037;
      }
   }
}
