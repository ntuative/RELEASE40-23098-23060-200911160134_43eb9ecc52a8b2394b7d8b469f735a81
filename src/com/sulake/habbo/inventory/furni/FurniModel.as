package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.inventory.recycler.RecyclerModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FurniModel implements IInventoryModel
   {
      
      private static const const_999:int = 100;
      
      public static const const_302:String = "pets";
      
      public static const const_41:String = "wall";
      
      public static const const_40:String = "floor";
       
      
      private var var_424:Timer;
      
      private var _view:FurniView;
      
      private var _disposed:Boolean = false;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_127:Timer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var var_1643:Boolean;
      
      private var var_581:IWindowContainer;
      
      private var var_709:Boolean;
      
      private var var_358:Map;
      
      private var _controller:HabboInventory;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _groupItemWindowBase:XML;
      
      private var var_894:int = -1;
      
      public function FurniModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager, param7:IHabboConfigurationManager)
      {
         super();
         _controller = param1;
         _communication = param3;
         _windowManager = param2;
         _assets = param4;
         _roomEngine = param5;
         _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_214,onObjectPlaced);
         var_424 = new Timer(const_999,1);
         var_424.addEventListener(TimerEvent.TIMER_COMPLETE,onImageUpdateTimerEvent);
         var _loc8_:IAsset = _assets.getAssetByName("inventory_thumb_xml");
         var _loc9_:XmlAsset = XmlAsset(_loc8_);
         _groupItemWindowBase = XML(_loc9_.content);
         clearFurniList();
         _view = new FurniView(this,_windowManager,_assets,_roomEngine,param7);
         _view.switchCategory(const_40);
      }
      
      public function get isTradingOpen() : Boolean
      {
         return _controller.getSubCategoryViewId() == InventorySubCategory.const_259;
      }
      
      public function requestCurrentActionOnSelection() : void
      {
         if(isTradingOpen)
         {
            requestSelectedFurniToTrading();
         }
         else
         {
            requestSelectedFurniPlacement(false);
         }
      }
      
      public function addLockTo(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [const_40,const_41];
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc7_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc8_] as GroupItem;
                  _loc4_.addLockTo(param1);
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         _view.updateActionView();
      }
      
      public function getGroupItemInIndex(param1:int, param2:String = null) : GroupItem
      {
         if(param2 == null)
         {
            param2 = "null";
         }
         var _loc3_:Array = getCategoryContent(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1] as GroupItem;
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         return _controller.canUserOfferToTrade();
      }
      
      public function removeLockFrom(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [const_40,const_41];
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc7_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc8_] as GroupItem;
                  _loc4_.removeLockFrom(param1);
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         _view.updateActionView();
      }
      
      public function getAllStripIds(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Array = var_358.getKeys();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = var_358.getValue(_loc2_[_loc3_]) as Array;
            if(_loc4_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc6_ = GroupItem(_loc4_[_loc5_]);
                  _loc7_ = _loc6_.getTotalCount();
                  if(_loc6_.category == FurniCategory.const_509)
                  {
                     _loc7_ = 1;
                  }
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     param1.push(GroupItem(_loc4_[_loc5_]).getAt(_loc8_).id);
                     _loc8_++;
                  }
                  _loc5_++;
               }
            }
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _controller = null;
            if(var_358 != null)
            {
               var_358.dispose();
               var_358 = null;
            }
            if(_view != null)
            {
               _view.dispose();
               _view = null;
            }
            if(_roomEngine != null)
            {
               if(false)
               {
                  _roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_214,onObjectPlaced);
               }
               _roomEngine = null;
            }
            _communication = null;
            _assets = null;
            _windowManager = null;
            if(var_424 != null)
            {
               var_424.removeEventListener(TimerEvent.TIMER_COMPLETE,onImageUpdateTimerEvent);
               var_424.stop();
               var_424 = null;
            }
            if(var_127 != null)
            {
               var_127.removeEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
               var_127.stop();
               var_127 = null;
            }
            if(var_581 != null)
            {
               var_581.dispose();
               var_581 = null;
            }
            _disposed = true;
         }
      }
      
      private function requestSelectedFurniToMover(param1:IItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(param1 is FloorItem)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
         }
         if(param1.category == FurniCategory.const_154)
         {
            _loc3_ = _roomEngine.initializeRoomObjectInsert(param1.id,_loc2_,param1.type,param1.extras);
         }
         else
         {
            _loc3_ = _roomEngine.initializeRoomObjectInsert(param1.id,_loc2_,param1.type);
         }
         if(_loc3_)
         {
            var_894 = param1.ref;
            if(!_controller.recyclerModel.running)
            {
               requestClose();
            }
            var_709 = true;
         }
         _view.updateActionView();
      }
      
      public function createNewGroupItemTemplate(param1:int, param2:String, param3:int, param4:String = null, param5:Boolean = false) : GroupItem
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param3 == FurniCategory.const_285)
         {
            _loc7_ = _assets.getAssetByName("icon_wallpaper_png");
            if(_loc7_ != null)
            {
               _loc6_ = _loc7_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_314)
         {
            _loc7_ = _assets.getAssetByName("icon_floor_png");
            if(_loc7_ != null)
            {
               _loc6_ = _loc7_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_276)
         {
            _loc7_ = _assets.getAssetByName("icon_landscape_png");
            if(_loc7_ != null)
            {
               _loc6_ = _loc7_.content as BitmapData;
            }
         }
         var _loc9_:IAsset = _assets.getAssetByName("thumb_icon_recycle_png");
         if(_loc9_ != null)
         {
            _loc8_ = _loc9_.content as BitmapData;
         }
         if(var_581 == null)
         {
            var_581 = _windowManager.buildFromXML(_groupItemWindowBase) as IWindowContainer;
         }
         var _loc10_:IWindowContainer = var_581.clone() as IWindowContainer;
         return new GroupItem(param1,param2,param3,_loc10_,_roomEngine,_loc8_.clone(),_controller.recyclerModel.running,param4,_loc6_,param5);
      }
      
      public function requestClose() : void
      {
         _controller.closeView();
      }
      
      public function removeAllLocks() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_40,const_41];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc6_];
            _loc1_ = getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc7_] as GroupItem;
                  if(_loc3_ != null)
                  {
                     _loc3_.removeAllLocks();
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         if(_view != null)
         {
            _view.updateActionView();
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function initTimeout(param1:TimerEvent) : void
      {
         if(var_127 != null)
         {
            var_127.removeEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
            var_127.stop();
            var_127 = null;
         }
         requestNewList();
      }
      
      public function requestSelectedFurniToTrading() : void
      {
         var _loc1_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:TradingModel = _controller.tradingModel;
         if(_loc3_ != null)
         {
            _loc3_.requestAddItemToTrading(_loc2_.id,_loc2_.type,_loc2_.category,_loc2_.groupable,_loc2_.extras);
         }
         _view.updateActionView();
      }
      
      public function isListInited() : Boolean
      {
         return var_1643;
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case InventorySubCategory.const_259:
               cancelFurniInMover();
               if(_view != null)
               {
                  _view.updateActionView();
               }
               break;
            case InventorySubCategory.const_898:
               removeAllLocks();
               if(_view != null)
               {
                  _view.updateActionView();
               }
         }
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         if(param1 > 0)
         {
            if(var_127 != null)
            {
               var_127.removeEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
               var_127.stop();
               var_127 = null;
            }
            var_127 = new Timer(param1,1);
            var_127.addEventListener(TimerEvent.TIMER_COMPLETE,initTimeout);
            var_127.start();
         }
         else
         {
            requestNewList();
         }
      }
      
      public function addFurniAsLast(param1:IItem, param2:Boolean = false) : void
      {
         addFurniAt(param1,param2);
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _view.getWindowContainer();
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = getCategoryContent(param1);
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return;
         }
         if(_loc3_.length > param2)
         {
            _loc4_ = _loc3_[param2] as GroupItem;
            _loc4_.isSelected = true;
            _view.updateItem(param1,_loc4_,param2);
         }
         if(_loc4_ && _loc4_.isSelected)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(_loc5_ != param2)
               {
                  _loc4_ = _loc3_[_loc5_] as GroupItem;
                  if(_loc4_ && _loc4_.isSelected)
                  {
                     _loc4_.isSelected = false;
                  }
               }
               _loc5_++;
            }
         }
         _view.updateActionView();
      }
      
      public function getGroupItemByType(param1:int) : GroupItem
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_40,const_41];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  if(_loc4_.type == param1)
                  {
                     return _loc4_;
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public function requestNewList() : void
      {
         _communication.getHabboMainConnection(null).send(new RequestFurniInventoryComposer(0,0));
      }
      
      public function showRecyclable(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc6_:Array = [const_40,const_41];
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc3_ = _loc6_[_loc7_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc8_] as GroupItem;
                  _loc4_.showRecyclable = param1;
                  _loc8_++;
               }
            }
            _loc7_++;
         }
         _view.updateActionView();
      }
      
      public function switchCategory(param1:String) : void
      {
         _view.switchCategory(param1);
      }
      
      public function requestSelectedFurniToRecycler() : IItem
      {
         var _loc1_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:IItem = _loc1_.getOneForRecycle();
         if(_loc2_ == null)
         {
            return null;
         }
         _view.updateActionView();
         return _loc2_;
      }
      
      public function cancelFurniInMover() : void
      {
         if(var_894 > -1)
         {
            _roomEngine.cancelRoomObjectInsert();
            var_709 = false;
            var_894 = -1;
            return;
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_79 && false)
         {
            switch(_view.visibleCategoryId)
            {
               case const_40:
                  _controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_41:
                  _controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_302:
                  _controller.toggleInventoryPage(InventoryCategory.const_219);
            }
         }
      }
      
      private function onImageUpdateTimerEvent(param1:TimerEvent) : void
      {
         initListImages();
      }
      
      public function updatePostItCount(param1:int, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:Array = getCategoryContent(const_41);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_] as GroupItem;
            _loc6_ = _loc5_.getItem(param1) as WallItem;
            if(_loc6_ != null)
            {
               _loc6_.extras = String(param2);
               _loc5_.replaceItem(param1,_loc6_);
            }
            _loc4_++;
         }
      }
      
      public function updateLocks() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc10_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:TradingModel = _controller.tradingModel;
         if(_loc2_ != null)
         {
            _loc1_ = _loc1_.concat(_loc2_.getOwnItemIdsInTrade());
         }
         var _loc3_:RecyclerModel = _controller.recyclerModel;
         if(_loc3_ != null)
         {
            _loc1_ = _loc1_.concat(_loc3_.getOwnItemsInRecycler());
         }
         if(_loc1_.length == 0)
         {
            removeAllLocks();
            return;
         }
         var _loc8_:Array = [const_40,const_41];
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc5_ = _loc8_[_loc9_];
            _loc4_ = getCategoryContent(_loc5_);
            if(_loc4_ != null)
            {
               _loc10_ = 0;
               while(_loc10_ < _loc4_.length)
               {
                  _loc6_ = _loc4_[_loc10_] as GroupItem;
                  _loc6_.addLocksFromData(_loc1_);
                  _loc10_++;
               }
            }
            _loc9_++;
         }
         _view.updateActionView();
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(var_709 && param1.type == RoomEngineObjectEvent.const_214)
         {
            _controller.showView();
            var_709 = false;
         }
      }
      
      public function initListImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = [const_40,const_41];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc1_ = getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc6_] as GroupItem;
                  if(!_loc3_.isImageInited)
                  {
                     _loc3_.initImage();
                     if(!_loc3_.isImageFinished)
                     {
                        var_424.reset();
                        var_424.start();
                        return;
                     }
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
      }
      
      public function removeFurni(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc7_:Array = [const_40,const_41];
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc3_ = _loc7_[_loc8_];
            _loc2_ = getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc9_] as GroupItem;
                  _loc10_ = _loc4_.remove(param1);
                  if(_loc10_)
                  {
                     if(var_894 == _loc10_.ref)
                     {
                        cancelFurniInMover();
                     }
                     if(_loc4_.getTotalCount() <= 0)
                     {
                        _view.removeItem(_loc3_,_loc9_);
                        _loc2_.splice(_loc9_,1);
                        if(_loc4_.isSelected)
                        {
                           toggleItemSelection(_loc3_,0);
                        }
                     }
                     else
                     {
                        _view.updateActionView();
                     }
                     return;
                  }
                  _loc9_++;
               }
            }
            _loc8_++;
         }
      }
      
      public function closingInventoryView() : void
      {
      }
      
      public function getSelectedItemIndex(param1:String = null) : int
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            if(_view == null)
            {
               return -1;
            }
         }
         if(param1 == null)
         {
            param1 = "null";
         }
         var _loc3_:Array = getCategoryContent(param1);
         if(_loc3_ == null)
         {
            return -1;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ = _loc3_[_loc5_] as GroupItem;
            if(_loc4_.isSelected)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public function setListInited() : void
      {
         var_1643 = true;
      }
      
      public function furniCategorySwitch(param1:String) : void
      {
         if(false)
         {
            switch(_view.visibleCategoryId)
            {
               case const_40:
                  _controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_41:
                  _controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_302:
                  _controller.toggleInventoryPage(InventoryCategory.const_219);
            }
         }
      }
      
      public function requestSelectedFurniPlacement(param1:Boolean = false) : Boolean
      {
         var _loc2_:GroupItem = getGroupItemInIndex(getSelectedItemIndex(),_view.visibleCategoryId);
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.getUnlockedCount() == 0)
         {
            return false;
         }
         var _loc3_:IItem = _loc2_.peek();
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc3_.category == FurniCategory.const_314 || _loc3_.category == FurniCategory.const_285 || _loc3_.category == FurniCategory.const_276)
         {
            if(param1)
            {
               return false;
            }
            _communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc3_.id));
         }
         else
         {
            requestSelectedFurniToMover(_loc3_);
         }
         _view.updateActionView();
         return true;
      }
      
      public function displayItemInfo(param1:GroupItem) : void
      {
         if(_view && true)
         {
            _view.displayItemInfo(param1);
         }
      }
      
      public function getCategoryContent(param1:String) : Array
      {
         return var_358.getValue(param1);
      }
      
      public function clearFurniList() : void
      {
         var_358 = new Map();
         var_358.add(const_40,new Array());
         var_358.add(const_41,new Array());
         if(_view != null)
         {
            _view.clearViews();
         }
      }
      
      public function addFurniAt(param1:IItem, param2:Boolean = false, param3:int = -1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 is FloorItem)
         {
            _loc4_ = const_40;
         }
         else
         {
            if(!(param1 is WallItem))
            {
               return;
            }
            _loc4_ = const_41;
         }
         var _loc6_:Array = getCategoryContent(_loc4_);
         if(!param1.groupable)
         {
            _loc5_ = createNewGroupItemTemplate(param1.type,_loc4_,param1.category,null,param2);
            _loc5_.push(param1);
            if(param3 == -1)
            {
               _loc6_.push(_loc5_);
            }
            else
            {
               _loc6_.splice(param3,0,_loc5_);
            }
            if(_view != null)
            {
               if(param3 == -1)
               {
                  _view.addItemToBottom(_loc4_,_loc5_);
               }
               else
               {
                  _view.addItemAt(_loc4_,_loc5_,param3);
               }
            }
         }
         else
         {
            _loc8_ = 0;
            for(; _loc8_ < _loc6_.length; _loc8_++)
            {
               _loc7_ = _loc6_[_loc8_] as GroupItem;
               if(_loc7_.type == param1.type)
               {
                  if(param1.category != FurniCategory.const_154)
                  {
                     _loc5_ = _loc7_;
                  }
                  if(_loc7_.extras == param1.extras)
                  {
                     _loc5_ = _loc7_;
                     break;
                  }
                  continue;
                  break;
               }
            }
            if(_loc5_)
            {
               _loc5_.push(param1);
            }
            else
            {
               _loc5_ = createNewGroupItemTemplate(param1.type,_loc4_,param1.category,param1.extras,param2);
               _loc5_.push(param1);
               if(_view != null)
               {
                  if(param3 == -1)
                  {
                     _loc6_.push(_loc5_);
                     _view.addItemToBottom(_loc4_,_loc5_);
                  }
                  else
                  {
                     _loc6_.unshift(_loc5_);
                     _view.addItemAt(_loc4_,_loc5_,param3);
                  }
               }
            }
         }
         if(_loc5_.isSelected)
         {
            _view.updateActionView();
         }
      }
   }
}
