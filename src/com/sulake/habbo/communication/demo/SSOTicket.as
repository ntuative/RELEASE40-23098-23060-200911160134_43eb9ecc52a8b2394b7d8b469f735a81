package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class SSOTicket extends EventDispatcher
   {
      
      public static const const_264:String = "failure";
      
      public static const const_273:String = "success";
       
      
      private var _assets:IAssetLibrary;
      
      private var var_1242:String;
      
      private var var_2041:String;
      
      private var var_1475:String;
      
      private var var_1241:IHabboWebLogin;
      
      private var var_1:URLLoader;
      
      private var var_2241:String;
      
      public function SSOTicket(param1:IAssetLibrary, param2:IHabboWebLogin, param3:String)
      {
         super();
         _assets = param1;
         var_1241 = param2;
         var_1242 = "http://" + param3 + "/client";
         var_1241.init();
         var_1241.addEventListener(HabboWeb.const_191,requestClientURL);
      }
      
      public function get shockwaveClientUrl() : String
      {
         return var_2041;
      }
      
      private function requestClientURL(param1:Event = null) : void
      {
         var _loc2_:String = var_1242;
         if(_assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + var_1242);
         }
         var _loc3_:URLRequest = new URLRequest(var_1242);
         if(_assets.hasAsset(_loc2_))
         {
            _assets.removeAsset(_assets.getAssetByName(_loc2_));
         }
         var _loc4_:AssetLoaderStruct = _assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_30,clientURLComplete);
      }
      
      public function get ticket() : String
      {
         return var_1475;
      }
      
      private function clientURLComplete(param1:Event = null) : void
      {
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         var data:String = loaderStruct.assetLoader.content as String;
         if(data.indexOf("account/reauthenticate\"") > -1)
         {
            var_1241.requestReAuthenticate();
         }
         else
         {
            try
            {
               var_1475 = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
               var_2041 = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
               if(false)
               {
                  dispatchEvent(new Event(const_273));
               }
               else
               {
                  dispatchEvent(new Event(const_264));
               }
            }
            catch(e:Error)
            {
               trace(e);
               dispatchEvent(new Event(const_264));
            }
         }
      }
   }
}
