package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_776:Array;
      
      private var var_412:int;
      
      protected var var_163:Offer;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         var_163 = param1;
         var_776 = param2;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in var_776)
         {
            _loc1_.dispose();
         }
         var_776 = null;
         var_412 = 0;
      }
      
      public function get products() : Array
      {
         return var_776;
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function get firstProduct() : IProduct
      {
         return var_776[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_412 = param1;
      }
      
      public function get iconCallbackId() : int
      {
         return var_412;
      }
      
      public function get offer() : Offer
      {
         return var_163;
      }
   }
}
