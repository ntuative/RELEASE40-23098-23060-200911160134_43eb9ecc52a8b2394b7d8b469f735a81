package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_776:Array;
      
      private var var_818:int;
      
      private var var_1206:String;
      
      private var var_1207:int;
      
      private var var_817:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         var_1207 = param1.readInteger();
         var_1206 = param1.readString();
         var_818 = param1.readInteger();
         var_817 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_776 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_776.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_776;
      }
      
      public function get priceInCredits() : int
      {
         return var_818;
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
   }
}
