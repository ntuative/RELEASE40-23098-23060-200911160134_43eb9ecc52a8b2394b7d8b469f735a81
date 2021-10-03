package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements ICoreUpdateReceiver
   {
      
      public static const const_550:int = 2;
      
      public static const const_523:int = 4;
      
      private static const const_478:int = 2;
      
      private static const const_748:int = 1;
      
      public static const const_1538:int = 3;
      
      private static const const_1046:int = 4;
      
      private static const const_479:int = 22;
      
      public static const const_427:int = 1;
      
      private static const const_749:int = 3;
       
      
      private var var_1857:int = 0;
      
      private var var_1156:IRegionWindow;
      
      private var var_382:int;
      
      private var var_1154:Boolean = true;
      
      private var var_1409:GuestRoomListCtrl;
      
      private var var_27:IFrameWindow;
      
      private var var_415:Timer;
      
      private var var_261:IWindowContainer;
      
      private var var_195:IWindowContainer;
      
      private var var_224:IWindowContainer;
      
      private var var_11:IWindow;
      
      private var var_1153:Boolean;
      
      private var var_1411:OfficialRoomListCtrl;
      
      private var var_33:IWindowContainer;
      
      private var var_1410:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1155:int = 0;
      
      private var var_208:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_1410 = new PopularTagsListCtrl(_navigator);
         var_1409 = new GuestRoomListCtrl(_navigator);
         var_1411 = new OfficialRoomListCtrl(_navigator);
         var_415 = new Timer(300,1);
         var_415.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_656)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_586)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_520)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_183)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_271)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_516)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_709)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_294)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_195)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_444)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_27 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_208 = ITabContextWindow(var_27.findChildByName("tab_context"));
         var_33 = IWindowContainer(var_27.findChildByName("tab_content"));
         var_224 = IWindowContainer(var_27.findChildByName("custom_content"));
         var_195 = IWindowContainer(var_27.findChildByName("list_content"));
         var_261 = IWindowContainer(var_27.findChildByName("custom_footer"));
         var_11 = var_27.findChildByName("loading_text");
         var _loc1_:IWindow = var_27.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1156 = IRegionWindow(var_27.findChildByName("to_hotel_view"));
         var_1156.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_27.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_208.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_35,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_27.scaler.setParamFlag(HabboWindowParam.const_650,false);
         var_27.scaler.setParamFlag(HabboWindowParam.const_1298,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_27;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_53)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1153)
         {
            var_1153 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_324:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_261:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_253:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_247:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_194:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += const_479;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= const_479;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_444:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_656:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_586:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_520:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_183:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_445:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_271:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_516:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_709:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_294:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_195:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_195.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_27 != null && false;
      }
      
      private function method_4(param1:Boolean) : void
      {
         Util.hideChildren(var_195);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_1410);
         refreshScrollbar(var_1409);
         refreshScrollbar(var_1411);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += const_479;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         Logger.log("START SEARCH: " + _loc5_.id + " => " + _loc6_.id);
         this.var_1154 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_427)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_550)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer(int(param3)));
         }
         if(!isOpen())
         {
            open();
            this.var_382 = const_478;
            this.var_195.blend = 0;
            if(this.var_224.visible)
            {
               this.var_224.blend = 0;
               this.var_261.blend = 0;
            }
         }
         else
         {
            this.var_382 = const_748;
         }
         this.var_1155 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_224);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_224);
         if(Util.hasVisibleChildren(var_224))
         {
            var_224.visible = true;
         }
         else
         {
            var_224.visible = false;
            var_224.blend = 1;
         }
      }
      
      public function dispose() : void
      {
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_46 || param2 != var_27)
         {
            return;
         }
         if(!this.var_415.running)
         {
            this.var_415.reset();
            this.var_415.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1411,"official_rooms");
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1410,"popular_tags");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_1409,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_208.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1153 = true;
            var_208.selector.setSelected(_loc1_.button);
         }
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_27 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_27.visible = true;
         var_27.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_43,HabboToolbarIconEnum.NAVIGATOR,var_27));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_261);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_261);
         if(Util.hasVisibleChildren(var_261))
         {
            var_261.visible = true;
         }
         else
         {
            var_261.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_28)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_27 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         method_4(true);
         refreshFooter();
         var_224.height = Util.getLowestPoint(var_224);
         var_261.height = Util.getLowestPoint(var_261);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_33,["custom_content","list_content"],var_224.y,8);
         var_195.height = var_195.height + _loc1_ - 0 - 0 + var_1857;
         Util.moveChildrenToColumn(var_33,["list_content","custom_footer"],var_195.y,8);
         var_1857 = var_261.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_195 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_382 == const_748)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_195.blend - _loc2_));
            this.var_195.blend = _loc3_;
            this.var_224.blend = !!var_1154 ? Number(_loc3_) : Number(1);
            this.var_261.blend = !!var_1154 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_382 = const_478;
            }
         }
         else if(var_382 == const_478)
         {
            if(var_1155 % 10 == 1)
            {
               var_11.visible = true;
            }
            ++var_1155;
            if(!_navigator.data.isLoading())
            {
               var_382 = const_749;
            }
         }
         else if(var_382 == const_749)
         {
            this.refresh();
            var_382 = const_1046;
         }
         else
         {
            var_11.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_195.blend + _loc2_));
            this.var_195.blend = _loc3_;
            this.var_224.blend = !!var_1154 ? Number(_loc3_) : Number(1);
            this.var_261.blend = !!var_1154 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1156,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1156,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_27 != null)
         {
            var_27.visible = false;
         }
      }
   }
}
