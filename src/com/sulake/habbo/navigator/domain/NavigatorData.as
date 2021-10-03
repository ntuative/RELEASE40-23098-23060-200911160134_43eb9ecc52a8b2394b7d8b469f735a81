package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1364:int = 10;
       
      
      private var var_1406:NavigatorSettingsMessageParser;
      
      private var var_1148:int;
      
      private var var_1834:Boolean;
      
      private var var_1832:int;
      
      private var var_775:Dictionary;
      
      private var var_2177:int;
      
      private var var_1831:int;
      
      private var var_1835:int;
      
      private var var_323:Array;
      
      private var var_1830:int;
      
      private var var_1121:Array;
      
      private var var_529:PublicRoomShortData;
      
      private var var_380:RoomEventData;
      
      private var var_139:MsgWithRequestId;
      
      private var var_1603:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1833:Boolean;
      
      private var var_194:GuestRoomData;
      
      private var var_624:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_323 = new Array();
         var_775 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1832;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1833;
      }
      
      public function startLoading() : void
      {
         this.var_624 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1833 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_380 != null)
         {
            var_380.dispose();
         }
         var_380 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_139 != null && var_139 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_139 != null && var_139 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_139 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_194;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_529 = null;
         var_194 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_529 = param1.publicSpace;
            var_380 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_380 != null)
         {
            var_380.dispose();
            var_380 = null;
         }
         if(var_529 != null)
         {
            var_529.dispose();
            var_529 = null;
         }
         if(var_194 != null)
         {
            var_194.dispose();
            var_194 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_624 = false;
         if(var_1121 == null)
         {
            var_1121 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1406;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_624 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_323.length > param1)
         {
            return var_323[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2177 = param1.limit;
         this.var_1148 = param1.favouriteRoomIds.length;
         this.var_775 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_775[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_139 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_323;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_529;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1835 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1834;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_139 = param1;
         var_624 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_323.length)
         {
            if((var_323[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_194 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_624;
      }
      
      public function set categories(param1:Array) : void
      {
         var_323 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_1831;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1830;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1406 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_139 == null)
         {
            return;
         }
         var_139.dispose();
         var_139 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_380;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_775[param1] = !!param2 ? "yes" : null;
         var_1148 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_139 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1121;
      }
      
      public function get avatarId() : int
      {
         return var_1835;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_139 != null && var_139 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1834 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1831 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1603 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_194 != null)
         {
            var_194.dispose();
         }
         var_194 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_323)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_194 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1406.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1148 >= var_2177;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1830 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1603;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_194 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1832 = param1;
      }
   }
}
