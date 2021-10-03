package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_965:int = 4;
      
      public static const TYPE_PUBLIC_SPACE:int = 3;
      
      public static const const_698:int = 2;
      
      public static const const_923:int = 1;
       
      
      private var var_1674:String;
      
      private var _disposed:Boolean;
      
      private var var_1507:int;
      
      private var var_1673:Boolean;
      
      private var var_718:String;
      
      private var var_721:PublicRoomData;
      
      private var _index:int;
      
      private var var_1676:String;
      
      private var _type:int;
      
      private var var_1551:String;
      
      private var var_722:GuestRoomData;
      
      private var var_1675:String;
      
      private var var_1677:int;
      
      public function OfficialRoomEntryData(param1:int, param2:IMessageDataWrapper)
      {
         super();
         _index = param1;
         var_1674 = param2.readString();
         var_1675 = param2.readString();
         var_1673 = param2.readInteger() == 1;
         var_1676 = param2.readString();
         var_718 = param2.readString();
         var_1507 = param2.readInteger();
         _type = param2.readInteger();
         if(_type == const_923)
         {
            var_1551 = param2.readString();
         }
         else if(_type == TYPE_PUBLIC_SPACE)
         {
            var_721 = new PublicRoomData(param2);
         }
         else if(_type == const_698)
         {
            var_722 = new GuestRoomData(param2);
         }
         else if(_type == const_965)
         {
            var_1677 = param2.readInteger();
         }
      }
      
      public function get tag() : String
      {
         return var_1551;
      }
      
      public function get userCount() : int
      {
         return var_1507;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1673;
      }
      
      public function get picText() : String
      {
         return var_1676;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_923)
         {
            return 0;
         }
         if(this.type == const_698)
         {
            return this.var_722.maxUserCount;
         }
         if(this.type == TYPE_PUBLIC_SPACE)
         {
            return this.var_721.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1675;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_722 != null)
         {
            this.var_722.dispose();
            this.var_722 = null;
         }
         if(this.var_721 != null)
         {
            this.var_721.dispose();
            this.var_721 = null;
         }
      }
      
      public function get popupCaption() : String
      {
         return var_1674;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_722;
      }
      
      public function get picRef() : String
      {
         return var_718;
      }
      
      public function get flatCategoryId() : int
      {
         return var_1677;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_721;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
