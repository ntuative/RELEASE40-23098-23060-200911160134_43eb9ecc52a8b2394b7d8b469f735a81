package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2025:XML;
      
      private var var_1471:ITextWindow;
      
      private var var_1470:ITextWindow;
      
      private var var_2026:XML;
      
      private var var_830:IWindowContainer;
      
      private var var_2191:ITextWindow;
      
      private var var_2024:String = "";
      
      private var var_2236:IButtonWindow;
      
      private var var_2023:XML;
      
      private var var_1469:ITextWindow;
      
      private var var_2022:XML;
      
      private var var_831:IButtonWindow;
      
      private var var_163:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_289:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2026) as IWindowContainer;
               break;
            case Offer.const_400:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2022) as IWindowContainer;
               break;
            case Offer.const_403:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2025) as IWindowContainer;
               break;
            case Offer.const_499:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2023) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_830 != null)
            {
               _window.removeChild(var_830);
               var_830.dispose();
            }
            var_830 = _loc2_;
            _window.addChild(_loc2_);
            var_830.x = 0;
            var_830.y = 0;
         }
         var_1469 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1470 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1471 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2191 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_831 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_831 != null)
         {
            var_831.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_831.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_163 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_163,page,var_2024);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2026 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2022 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2025 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2023 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_864,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2024 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_163 = param1.offer;
         attachStub(var_163.priceType);
         if(var_1469 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_163.priceInCredits));
            var_1469.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1470 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_163.priceInPixels));
            var_1470.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1471 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_163.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_163.priceInPixels));
            var_1471.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_831 != null)
         {
            var_831.enable();
         }
      }
   }
}
