package com.sulake.habbo.avatar.structure
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class AvatarStructureDownloadSet extends EventDispatcher
   {
      
      public static const DOWNLOAD_SET_DONE:String = "DOWNLOAD_SET_DONE";
       
      
      private var var_1352:int = 0;
      
      private var var_1351:int = 0;
      
      public function AvatarStructureDownloadSet()
      {
         super();
      }
      
      public function add(param1:AvatarStructureDownload) : void
      {
         param1.addEventListener(AvatarStructureDownload.const_939,onDownloadDone);
         ++var_1352;
      }
      
      private function onDownloadDone(param1:Event = null) : void
      {
         ++var_1351;
         if(var_1351 == var_1352)
         {
            dispatchEvent(new Event(DOWNLOAD_SET_DONE));
         }
      }
   }
}
