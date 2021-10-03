package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1507:int;
      
      private var var_1840:String;
      
      private var var_1839:int;
      
      private var var_1838:int;
      
      private var var_593:Boolean;
      
      private var var_1538:Boolean;
      
      private var var_369:int;
      
      private var var_1037:String;
      
      private var var_1536:int;
      
      private var var_1132:int;
      
      private var _ownerName:String;
      
      private var var_670:String;
      
      private var var_1841:int;
      
      private var var_1842:RoomThumbnailData;
      
      private var var_1539:Boolean;
      
      private var var_571:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_571 = new Array();
         super();
         var_369 = param1.readInteger();
         var_593 = param1.readBoolean();
         var_670 = param1.readString();
         _ownerName = param1.readString();
         var_1536 = param1.readInteger();
         var_1507 = param1.readInteger();
         var_1841 = param1.readInteger();
         var_1037 = param1.readString();
         var_1839 = param1.readInteger();
         var_1539 = param1.readBoolean();
         var_1838 = param1.readInteger();
         var_1132 = param1.readInteger();
         var_1840 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_571.push(_loc4_);
            _loc3_++;
         }
         var_1842 = new RoomThumbnailData(param1);
         var_1538 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1841;
      }
      
      public function get roomName() : String
      {
         return var_670;
      }
      
      public function get userCount() : int
      {
         return var_1507;
      }
      
      public function get score() : int
      {
         return var_1838;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1840;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1539;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1538;
      }
      
      public function get event() : Boolean
      {
         return var_593;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_571 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1132;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1839;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1842;
      }
      
      public function get doorMode() : int
      {
         return var_1536;
      }
      
      public function get flatId() : int
      {
         return var_369;
      }
      
      public function get description() : String
      {
         return var_1037;
      }
   }
}
