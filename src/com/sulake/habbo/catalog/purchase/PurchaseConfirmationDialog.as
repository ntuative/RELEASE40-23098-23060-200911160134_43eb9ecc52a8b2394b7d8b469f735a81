package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.geom.Rectangle;
   
   public class PurchaseConfirmationDialog
   {
       
      
      private var var_2145:int = 0;
      
      private var _window:IFrameWindow;
      
      private var var_80:IHabboCatalog;
      
      private var var_163:Offer;
      
      private var var_867:String;
      
      private var var_491:Boolean = false;
      
      private var _itemList:IItemListWindow;
      
      private var var_576:ICatalogPage;
      
      private var _localization:ICoreLocalizationManager;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         super();
         _localization = param1;
      }
      
      private function onActivateGift(param1:WindowEvent = null) : void
      {
         var_491 = true;
         showDialog();
      }
      
      private function reset() : void
      {
         var_163 = null;
         var_576 = null;
         var_867 = "";
         var_2145 = 0;
         var_491 = false;
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
      }
      
      private function eventProcessor(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:String = (param1.target as IWindow).name;
         switch(_loc2_)
         {
            case "button_ok":
               if(var_491)
               {
                  _loc3_ = _window.findChildByName("receiver") as ITextFieldWindow;
                  _loc4_ = _window.findChildByName("message") as ITextFieldWindow;
                  _loc5_ = _loc3_ == null ? "" : _loc3_.text;
                  _loc6_ = _loc4_ == null ? "" : _loc4_.text;
                  HabboCatalog(var_80).purchaseProduct(var_576,var_163,var_867,true,_loc5_,_loc6_);
               }
               else
               {
                  HabboCatalog(var_80).purchaseProduct(var_576,var_163,var_867);
               }
               dispose();
               break;
            case "button_cancel":
            case "header_button_close":
               dispose();
         }
      }
      
      public function showOffer(param1:IHabboCatalog, param2:Offer, param3:ICatalogPage, param4:String = "") : void
      {
         reset();
         var_163 = param2;
         var_576 = param3;
         var_80 = param1;
         var_867 = param4;
         showDialog();
      }
      
      private function onDeActivateGift(param1:WindowEvent = null) : void
      {
         var_491 = false;
         showDialog();
      }
      
      private function showDialog() : void
      {
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         _loc1_ = var_80.assets.getAssetByName("habbo_orderinfo_dialog") as XmlAsset;
         var _loc2_:XML = _loc1_.content as XML;
         if(_window == null)
         {
            _window = var_80.windowManager.createWindow("OrderInfo","${catalog.purchase.confirmation.dialog.title}",HabboWindowType.const_316,HabboWindowStyle.const_39,0 | 0 | 0,new Rectangle(10,10,300,180),null) as IFrameWindow;
         }
         else
         {
            _window.removeChildAt(-1);
         }
         var _loc3_:IWindowContainer = var_80.windowManager.buildFromXML(_loc2_) as IWindowContainer;
         _window.addChild(_loc3_);
         _window.width = _loc3_.width + 20;
         _window.height = _loc3_.height + 40;
         _loc3_.x = 10;
         _loc3_.y = 30;
         _itemList = _window.findChildByName("orderItemList") as IItemListWindow;
         var _loc4_:Boolean = true;
         if(false)
         {
            _loc4_ = false;
         }
         var _loc5_:int = var_80.getPurse().credits - 0;
         if(_loc5_ < 0)
         {
            _loc4_ = false;
         }
         if(var_491)
         {
            _loc6_ = var_80.assets.getAssetByName("habbo_orderinfo_gift_checked") as XmlAsset;
         }
         else
         {
            _loc6_ = var_80.assets.getAssetByName("habbo_orderinfo_gift_unchecked") as XmlAsset;
         }
         _loc2_ = _loc6_.content as XML;
         var _loc7_:IWindow = var_80.windowManager.buildFromXML(_loc2_) as IWindow;
         if(_loc4_)
         {
            _itemList.addListItemAt(_loc7_,1);
            _window.height = NaN;
            _loc17_ = _window.findChildByName("buyAsGift") as ICheckBoxWindow;
            if(_loc17_ == null)
            {
               return;
            }
            if(var_491)
            {
               _loc17_.select();
            }
            _loc17_.addEventListener(WindowEvent.const_595,onDeActivateGift);
            _loc17_.addEventListener(WindowEvent.const_515,onActivateGift);
         }
         _window.center();
         var _loc8_:IButtonWindow = _window.findChildByName("button_ok") as IButtonWindow;
         var _loc9_:IButtonWindow = _window.findChildByName("button_cancel") as IButtonWindow;
         var _loc10_:IWindow = _window.findChildByTag("close");
         _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,eventProcessor);
         _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,eventProcessor);
         _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,eventProcessor);
         var _loc11_:IProductData = var_80.getProductData(var_163.localizationId);
         var _loc12_:String = _loc11_ == null ? "catalog.unknown.productname" : _loc11_.name;
         var_80.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc12_);
         var _loc13_:String = "";
         var _loc14_:String = "";
         var _loc15_:String = "";
         switch(var_163.priceType)
         {
            case Offer.const_289:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.credits");
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_163.priceInCredits.toString());
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_80.getPurse().credits.toString());
               _loc14_ = _loc16_.value;
               if(_loc5_ < 0)
               {
                  _loc5_ = 0;
               }
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",_loc5_.toString());
               _loc15_ = _loc16_.value;
               break;
            case Offer.const_499:
            case Offer.const_403:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.credits+pixels");
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","credits",var_163.priceInCredits.toString());
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","pixels",var_163.priceInPixels.toString());
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","credits",var_80.getPurse().credits.toString());
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","pixels",var_80.getPurse().pixels.toString());
               _loc14_ = _loc16_.value;
               _loc18_ = var_80.getPurse().pixels - 0;
               _loc19_ = var_80.getPurse().credits - 0;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","credits",_loc19_.toString());
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits+pixels","pixels",_loc18_.toString());
               _loc15_ = _loc16_.value;
               break;
            case Offer.const_400:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.pixels");
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.pixels","pixels",var_163.priceInPixels.toString());
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.pixels","pixels",var_80.getPurse().pixels.toString());
               _loc14_ = _loc16_.value;
               _loc20_ = var_80.getPurse().pixels - 0;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.pixels","pixels",_loc20_.toString());
               _loc15_ = _loc16_.value;
               break;
            case Offer.const_857:
               _loc16_ = _localization.getLocalization("catalog.purchase.confirmation.dialog.price.nothing");
               _loc13_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_80.getPurse().credits.toString());
               _loc14_ = _loc16_.value;
               _localization.registerParameter("catalog.purchase.confirmation.dialog.price.credits","credits",var_80.getPurse().credits.toString());
               _loc15_ = _loc16_.value;
         }
         var_80.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc13_);
         var_80.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc14_);
         var_80.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.remaining","remaining",_loc15_);
         _window.resizeToFitContent();
      }
      
      public function dispose() : void
      {
         reset();
      }
   }
}
