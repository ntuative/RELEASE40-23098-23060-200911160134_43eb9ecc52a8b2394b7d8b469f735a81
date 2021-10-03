package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_552:String = "me_menu_settings_view";
      
      private static const const_753:int = 10;
      
      public static const const_558:String = "me_menu_effects_view";
      
      public static const const_113:String = "me_menu_top_view";
      
      public static const const_1126:String = "me_menu_rooms_view";
      
      public static const const_916:String = "me_menu_dance_moves_view";
      
      public static const const_234:String = "me_menu_my_clothes_view";
       
      
      private var var_1993:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var var_69:IEventDispatcher;
      
      private var var_1992:int = 0;
      
      private var var_1994:Boolean = false;
      
      private var var_268:Boolean = false;
      
      private var var_1995:int = 0;
      
      private var var_1630:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_555:Boolean = false;
      
      private var var_97:ClubPromoView;
      
      private var var_1220:int = 0;
      
      private var var_986:Point;
      
      private var var_40:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher = null)
      {
         super(param1,param2,param3);
         var_986 = new Point(0,0);
         var_69 = param4;
         changeView(const_113);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_622,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_543,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_510,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_641,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_309,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_697,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_457,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_861,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_199,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_179,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_714,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_207,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_304,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_90,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_408,onTutorialEvent);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_555;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_268)
         {
            return;
         }
         if(var_40.window.name == const_552)
         {
            (var_40 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1220 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_268 && var_40.window.name == const_234))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_544);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_622,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_543,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_510,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_641,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_309,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_199,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_179,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_714,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_697,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_457,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_861,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_207,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_304,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_408,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_90,onTutorialEvent);
      }
      
      override public function dispose() : void
      {
         hide();
         var_69 = null;
         if(var_40 != null)
         {
            var_40.dispose();
            var_40 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1993;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1630 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_97 != null)
         {
            var_97.dispose();
            var_97 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1994;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_408:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_268 + " view: " + var_40.window.name);
               if(var_268 != true || var_40.window.name != const_113)
               {
                  return;
               }
               (var_40 as MeMenuMainView).setIconAssets("clothes_icon",const_113,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_90:
               hide();
         }
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_512);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_40 != null)
         {
            _mainContainer.removeChild(var_40.window);
            var_40.dispose();
            var_40 = null;
         }
         var_268 = false;
         var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1630 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1992;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_555 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_555 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1220 > 0;
         var_1220 = param1.daysLeft;
         var_1992 = param1.periodsLeft;
         var_1995 = param1.pastPeriods;
         var_1993 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_40 != null)
            {
               changeView(var_40.window.name);
            }
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1322,HabboWindowStyle.const_890,HabboWindowParam.const_39,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1994 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_40 != null && var_40.window.name != const_234)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_40 != null && var_40.window.name == const_234)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_930)
            {
               var_97 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1313);
            }
            else
            {
               var_97 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_390);
            }
            _loc2_ = _mainContainer.getChildByName(var_40.window.name);
            if(_loc2_ != null)
            {
               var_97.window.x = _loc2_.width + const_753;
               _mainContainer.addChild(var_97.window);
               _mainContainer.width = var_97.window.x + var_97.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_555 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_555 = true;
            }
         }
         if(var_40 != null && var_40.window.name == const_558)
         {
            (var_40 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1995;
      }
      
      public function get habboClubDays() : int
      {
         return var_1220;
      }
      
      public function updateSize() : void
      {
         if(var_40 != null)
         {
            var_986.x = var_40.window.width + 10;
            var_986.y = var_40.window.height;
            var_40.window.x = 5;
            var_40.window.y = 0;
            _mainContainer.width = var_986.x;
            _mainContainer.height = var_986.y;
            if(var_97 != null)
            {
               _mainContainer.width = var_97.window.x + var_97.window.width + const_753;
            }
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_268 = !var_268;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_268 = false;
               break;
            default:
               return;
         }
         if(var_268)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_40 != null && var_40.window.name == const_234)
         {
            if(var_97 != null)
            {
               var_97.dispose();
               var_97 = null;
            }
            changeView(const_113);
         }
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_97 != null)
         {
            var_97.dispose();
            var_97 = null;
         }
         switch(param1)
         {
            case const_113:
               _loc2_ = new MeMenuMainView();
               var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_558:
               _loc2_ = new MeMenuEffectsView();
               var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_916:
               _loc2_ = new MeMenuDanceView();
               var_69.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_234:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1126:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_552:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_40 != null)
            {
               _mainContainer.removeChild(var_40.window);
               var_40.dispose();
               var_40 = null;
            }
            var_40 = _loc2_;
            var_40.init(this,param1);
         }
         updateSize();
      }
      
      private function show() : void
      {
         changeView(const_113);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_635);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_268 = true;
      }
   }
}
