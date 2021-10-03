package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_143:int = 1;
      
      public static const const_1136:int = 3;
      
      public static const const_430:int = 2;
       
      
      private var var_1573:int;
      
      private var var_1583:int;
      
      private var var_1577:int;
      
      private var var_1532:int;
      
      private var _state:int;
      
      private var var_369:int;
      
      private var var_1072:int;
      
      private var var_1580:int;
      
      private var var_995:int;
      
      private var _roomResources:String;
      
      private var var_1579:int;
      
      private var var_1582:int;
      
      private var var_1578:String;
      
      private var var_1574:String;
      
      private var var_1575:int = 0;
      
      private var var_1243:String;
      
      private var _message:String;
      
      private var var_1572:int;
      
      private var var_1576:String;
      
      private var var_1132:int;
      
      private var var_670:String;
      
      private var var_1581:String;
      
      private var var_1316:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_995 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1575 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1582;
      }
      
      public function set roomName(param1:String) : void
      {
         var_670 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1579 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_670;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1532 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1583;
      }
      
      public function get priority() : int
      {
         return var_1573 + var_1575;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1580 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1574;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1316) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1132;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1582 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1072;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1578 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1579;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1532;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1581 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1243 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1580;
      }
      
      public function set priority(param1:int) : void
      {
         var_1573 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1583 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1578;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1577 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1574 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1572 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1243;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1072 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1577;
      }
      
      public function set flatId(param1:int) : void
      {
         var_369 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1132 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1316 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1572;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1576 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1316;
      }
      
      public function get reportedUserId() : int
      {
         return var_995;
      }
      
      public function get flatId() : int
      {
         return var_369;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1581;
      }
      
      public function get reporterUserName() : String
      {
         return var_1576;
      }
   }
}
