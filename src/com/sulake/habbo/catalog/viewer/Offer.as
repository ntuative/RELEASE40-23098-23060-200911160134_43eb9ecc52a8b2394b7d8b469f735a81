package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_857:String = "price_type_none";
      
      public static const const_417:String = "pricing_model_multi";
      
      public static const const_289:String = "price_type_credits";
      
      public static const const_403:String = "price_type_credits_and_pixels";
      
      public static const const_393:String = "pricing_model_bundle";
      
      public static const const_366:String = "pricing_model_single";
      
      public static const const_499:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1244:String = "pricing_model_unknown";
      
      public static const const_400:String = "price_type_pixels";
       
      
      private var var_818:int;
      
      private var var_1207:int;
      
      private var var_817:int;
      
      private var var_394:String;
      
      private var var_552:String;
      
      private var var_1959:int;
      
      private var var_576:ICatalogPage;
      
      private var var_1206:String;
      
      private var var_658:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         var_1207 = param1.offerId;
         var_1206 = param1.localizationId;
         var_818 = param1.priceInCredits;
         var_817 = param1.priceInPixels;
         var_576 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_394;
      }
      
      public function get page() : ICatalogPage
      {
         return var_576;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1959 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_658;
      }
      
      public function get localizationId() : String
      {
         return var_1206;
      }
      
      public function get offerId() : int
      {
         return var_1207;
      }
      
      public function get priceInPixels() : int
      {
         return var_817;
      }
      
      public function dispose() : void
      {
         var_1207 = 0;
         var_1206 = "";
         var_818 = 0;
         var_817 = 0;
         var_658.dispose();
      }
      
      public function get priceType() : String
      {
         return var_552;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1959;
      }
      
      public function get priceInCredits() : int
      {
         return var_818;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_394 = const_366;
            }
            else
            {
               var_394 = const_417;
            }
         }
         else if(param1.length > 1)
         {
            var_394 = const_393;
         }
         else
         {
            var_394 = const_1244;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_394)
         {
            case const_366:
               var_658 = new SingleProductContainer(this,param1);
               break;
            case const_417:
               var_658 = new MultiProductContainer(this,param1);
               break;
            case const_393:
               var_658 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_394);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_818 > 0 && var_817 > 0)
         {
            var_552 = const_403;
         }
         else if(var_818 > 0)
         {
            var_552 = const_289;
         }
         else if(var_817 > 0)
         {
            var_552 = const_400;
         }
         else
         {
            var_552 = const_857;
         }
      }
   }
}
