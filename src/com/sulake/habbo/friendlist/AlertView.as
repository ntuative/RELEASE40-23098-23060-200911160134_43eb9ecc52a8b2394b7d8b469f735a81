package com.sulake.habbo.friendlist
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class AlertView implements IDisposable
   {
      
      private static var var_1307:Dictionary = new Dictionary();
       
      
      private var _disposed:Boolean;
      
      private var var_240:IFrameWindow;
      
      private var _title:String;
      
      private var _friendList:HabboFriendList;
      
      private var var_1054:String;
      
      public function AlertView(param1:HabboFriendList, param2:String, param3:String = null)
      {
         super();
         _friendList = param1;
         var_1054 = param2;
         _title = param3;
      }
      
      function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function get friendList() : HabboFriendList
      {
         return _friendList;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_240 != null)
         {
            var_240.destroy();
            var_240 = null;
         }
         _friendList = null;
      }
      
      private function getAlert() : IFrameWindow
      {
         var _loc1_:IFrameWindow = IFrameWindow(_friendList.getXmlWindow(this.var_1054));
         var _loc2_:IWindow = _loc1_.findChildByTag("close");
         _loc2_.procedure = onClose;
         return _loc1_;
      }
      
      function setupContent(param1:IWindowContainer) : void
      {
      }
      
      public function show() : void
      {
         var _loc1_:IFrameWindow = IFrameWindow(var_1307[var_1054]);
         if(_loc1_ != null)
         {
            _loc1_.dispose();
         }
         var_240 = getAlert();
         if(_title != null)
         {
            var_240.caption = _title;
         }
         setupContent(var_240.content);
         var _loc2_:Rectangle = Util.getLocationRelativeTo(_friendList.view.mainWindow,var_240.width,var_240.height);
         var_240.x = _loc2_.x;
         var_240.y = _loc2_.y;
         var_1307[var_1054] = var_240;
      }
   }
}
