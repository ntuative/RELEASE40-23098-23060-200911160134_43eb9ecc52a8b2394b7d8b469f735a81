package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_934:String = "AssetLoaderEventUnload";
      
      public static const const_45:String = "AssetLoaderEventError";
      
      public static const const_986:String = "AssetLoaderEventOpen";
      
      public static const const_974:String = "AssetLoaderEventProgress";
      
      public static const const_946:String = "AssetLoaderEventStatus";
      
      public static const const_30:String = "AssetLoaderEventComplete";
       
      
      private var var_346:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_346 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_346;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_346);
      }
   }
}
