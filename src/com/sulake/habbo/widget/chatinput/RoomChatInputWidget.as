package com.sulake.habbo.widget.chatinput
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.exceptions.CrashMeError;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputDisplayEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatInputWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoomChatInputWidget extends RoomWidgetBase implements ICoreUpdateReceiver
   {
      
      private static const const_1073:int = 2;
      
      private static const const_1372:int = 150;
      
      private static const const_1071:int = 3000;
      
      private static const const_1072:int = 30000;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1193:int;
      
      private var var_1194:Boolean = false;
      
      private var var_1192:String = "";
      
      private var var_391:int = -1;
      
      private var var_809:Timer = null;
      
      private var _visualization:RoomChatInputView;
      
      private var var_1728:Boolean = false;
      
      private var var_808:Boolean = false;
      
      private var var_652:int = 0;
      
      private var var_43:Component = null;
      
      public function RoomChatInputWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         var_1193 = getTimer();
         super(param1,param2,param3);
         var_43 = param4;
         var_43.registerUpdateReceiver(this,9);
      }
      
      public function sendChat(param1:String, param2:int, param3:String = "") : void
      {
         if(var_808)
         {
            return;
         }
         checkForFlooding();
         var _loc4_:RoomWidgetChatMessage = new RoomWidgetChatMessage(RoomWidgetChatMessage.const_602,param1,param2,param3);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      private function method_6(param1:TimerEvent) : void
      {
         if(_visualization != null)
         {
            var_652 = var_652 - 1;
            _visualization.showFloodBlocking(var_652);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_299,onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_199,onRoomObjectDeselected);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_225,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetChatInputContentUpdateEvent.const_579,onChatInputUpdate);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_180,onUserInfo);
         param1.addEventListener(RoomWidgetChatInputDisplayEvent.const_578,onSettings);
         super.registerUpdateEvents(param1);
      }
      
      public function update(param1:uint) : void
      {
         if(var_1194)
         {
            var_1194 = false;
            throw new CrashMeError();
         }
      }
      
      public function get allowPaste() : Boolean
      {
         return var_1728;
      }
      
      public function get floodBlocked() : Boolean
      {
         return var_808;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         if(_visualization == null)
         {
            _visualization = new RoomChatInputView(this,windowManager,assets,localizations);
         }
         refreshWindowPosition();
      }
      
      private function onReleaseTimerComplete(param1:TimerEvent) : void
      {
         Logger.log("Releasing flood blocking");
         var_808 = false;
         var_391 = -1;
         if(_visualization != null)
         {
            _visualization.hideFloodBlocking();
         }
         var_809 = null;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var_1192 = param1.name;
      }
      
      private function onSettings(param1:RoomWidgetChatInputDisplayEvent) : void
      {
         var_1728 = param1.allowPaste;
      }
      
      private function onChatInputUpdate(param1:RoomWidgetChatInputContentUpdateEvent) : void
      {
         var _loc2_:String = "";
         switch(param1.messageType)
         {
            case RoomWidgetChatInputContentUpdateEvent.const_803:
               _loc2_ = localizations.getKey("widgets.chatinput.mode.whisper",":tell");
               _visualization.displaySpecialChatMessage(_loc2_,param1.userName);
               break;
            case RoomWidgetChatInputContentUpdateEvent.const_1325:
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_299,onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_199,onRoomObjectDeselected);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_225,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetChatInputContentUpdateEvent.const_579,onChatInputUpdate);
         param1.removeEventListener(RoomWidgetChatInputDisplayEvent.const_578,onSettings);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_180,onUserInfo);
      }
      
      private function onRoomObjectDeselected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var_1192 = "";
      }
      
      override public function dispose() : void
      {
         if(_visualization != null)
         {
            _visualization.dispose();
            _visualization = null;
         }
         var_43.removeUpdateReceiver(this);
         _disposed = true;
         super.dispose();
      }
      
      private function checkForFlooding() : Boolean
      {
         if(var_808)
         {
            return true;
         }
         var _loc1_:int = getTimer();
         if(var_391 == -1)
         {
            var_391 = 0;
            var_1193 = _loc1_;
         }
         else
         {
            ++var_391;
         }
         if(var_391 > const_1073)
         {
            if(_loc1_ < var_1193 + const_1071)
            {
               var_808 = true;
               var_652 = const_1072 / 1000;
               Logger.log("Enabling flood blocking");
               var_809 = new Timer(1000,var_652);
               var_809.addEventListener(TimerEvent.TIMER,method_6);
               var_809.addEventListener(TimerEvent.TIMER_COMPLETE,onReleaseTimerComplete);
               var_809.start();
               if(_visualization != null)
               {
                  _visualization.showFloodBlocking(var_652);
               }
               return true;
            }
            var_391 = -1;
         }
         return false;
      }
      
      public function triggerManualCrash() : void
      {
         var_1194 = true;
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_293,param1.id,param1.category);
      }
      
      public function get selectedUserName() : String
      {
         return var_1192;
      }
      
      private function refreshWindowPosition() : void
      {
         if(_visualization == null)
         {
            return;
         }
         var _loc1_:RoomWidgetChatInputWidgetMessage = new RoomWidgetChatInputWidgetMessage(RoomWidgetChatInputWidgetMessage.const_573,_visualization.window);
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
