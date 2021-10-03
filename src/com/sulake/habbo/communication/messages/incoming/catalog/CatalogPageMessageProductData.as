package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_274:String = "e";
      
      public static const const_136:String = "i";
      
      public static const const_150:String = "s";
       
      
      private var var_956:String;
      
      private var var_1162:String;
      
      private var var_1163:int;
      
      private var var_2009:int;
      
      private var var_957:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1162 = param1.readString();
         var_2009 = param1.readInteger();
         var_956 = param1.readString();
         var_957 = param1.readInteger();
         var_1163 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_957;
      }
      
      public function get productType() : String
      {
         return var_1162;
      }
      
      public function get expiration() : int
      {
         return var_1163;
      }
      
      public function get furniClassId() : int
      {
         return var_2009;
      }
      
      public function get extraParam() : String
      {
         return var_956;
      }
   }
}
