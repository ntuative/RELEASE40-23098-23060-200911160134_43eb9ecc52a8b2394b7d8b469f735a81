package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_180:String = "RWUIUE_PEER";
      
      public static const const_207:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1335:String = "BOT";
      
      public static const const_889:int = 2;
      
      public static const const_1142:int = 0;
      
      public static const const_873:int = 3;
       
      
      private var var_1224:String = "";
      
      private var var_2093:Boolean = false;
      
      private var var_1696:int = 0;
      
      private var var_1913:int = 0;
      
      private var var_2094:Boolean = false;
      
      private var var_1226:String = "";
      
      private var var_2095:Boolean = false;
      
      private var _respectLeft:int = 0;
      
      private var var_2099:Boolean = true;
      
      private var var_982:int = 0;
      
      private var var_2098:Boolean = false;
      
      private var var_1213:Boolean = false;
      
      private var var_2092:Boolean = false;
      
      private var var_1914:int = 0;
      
      private var var_2096:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_272:Array;
      
      private var var_1215:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1694:int = 0;
      
      private var var_2097:Boolean = false;
      
      private var var_2100:int = 0;
      
      private var var_1915:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_272 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1913;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1913 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2093;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2099;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2099 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2095 = param1;
      }
      
      public function get motto() : String
      {
         return var_1224;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2098 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1213;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1224 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2097;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1915;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1213 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2096;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1914 = param1;
      }
      
      public function get badges() : Array
      {
         return var_272;
      }
      
      public function get amIController() : Boolean
      {
         return var_2094;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2094 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2097 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2100 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1915 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1226 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2095;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2098;
      }
      
      public function get carryItem() : int
      {
         return var_1914;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1215;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1215 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         _respectLeft = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2100;
      }
      
      public function get realName() : String
      {
         return var_1226;
      }
      
      public function set webID(param1:int) : void
      {
         var_1694 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_272 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2092 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2096 = param1;
      }
      
      public function get respectLeft() : int
      {
         return _respectLeft;
      }
      
      public function get webID() : int
      {
         return var_1694;
      }
      
      public function set groupId(param1:int) : void
      {
         var_982 = param1;
      }
      
      public function get xp() : int
      {
         return var_1696;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2093 = param1;
      }
      
      public function get groupId() : int
      {
         return var_982;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2092;
      }
      
      public function set xp(param1:int) : void
      {
         var_1696 = param1;
      }
   }
}
