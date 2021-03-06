package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateRoomMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tabs;
   
   public class MyRoomsTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var var_460:IDropMenuWindow;
      
      private var var_2228:IWindowContainer;
      
      private var _navigator:HabboNavigator;
      
      public function MyRoomsTabPageDecorator(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         startSearch();
      }
      
      private function method_5(param1:int) : int
      {
         if(param1 == 1)
         {
            return Tabs.const_516;
         }
         if(param1 == 2)
         {
            return Tabs.const_586;
         }
         if(param1 == 3)
         {
            return Tabs.const_656;
         }
         if(param1 == 4)
         {
            return Tabs.const_520;
         }
         return Tabs.const_183;
      }
      
      private function startSearch() : void
      {
         var _loc1_:int = var_460 == null ? 0 : int(var_460.selection);
         Logger.log("Me subNavi selection changed: " + _loc1_);
         _navigator.mainViewCtrl.startSearch(Tabs.const_261,method_5(_loc1_));
      }
      
      private function prepareSubNavi() : void
      {
         var _loc1_:Array = new Array();
         _loc1_.push(_navigator.getText("navigator.navisel.myrooms"));
         _loc1_.push(_navigator.getText("navigator.navisel.wherearemyfriends"));
         _loc1_.push(_navigator.getText("navigator.navisel.myfriendsrooms"));
         _loc1_.push(_navigator.getText("navigator.navisel.myfavourites"));
         _loc1_.push(_navigator.getText("navigator.navisel.visitedrooms"));
         var_460.populate(_loc1_);
         var_460.selection = 0;
      }
      
      public function refreshCustomContent(param1:IWindowContainer) : void
      {
         var _loc3_:IWindowContainer = param1.getChildByName("me_header") as IWindowContainer;
         if(var_460 == null)
         {
            var_460 = IDropMenuWindow(_loc3_.findChildByName("meSubNavi"));
            var_460.procedure = onChangeSubNavi;
            prepareSubNavi();
         }
         _loc3_.visible = true;
      }
      
      public function refreshFooter(param1:IWindowContainer) : void
      {
         var _loc3_:IWindowContainer = param1.getChildByName("me_footer") as IWindowContainer;
         Util.setProc(_loc3_,"create_room_but",onCreateRoomClick);
         _navigator.refreshButton(_loc3_,"create_room",true,null,0);
         _loc3_.visible = true;
      }
      
      private function onCreateRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new CanCreateRoomMessageComposer());
      }
      
      private function onChangeSubNavi(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_53)
         {
            return;
         }
         startSearch();
      }
      
      public function tabSelected() : void
      {
         if(this.var_460 != null)
         {
            this.var_460.selection = 0;
         }
      }
   }
}
