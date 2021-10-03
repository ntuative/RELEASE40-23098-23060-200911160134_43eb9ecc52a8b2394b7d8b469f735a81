package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.exceptions.CrashMeError;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_146:uint = 3;
      
      private static const const_1034:String = "library";
      
      public static const const_1100:int = 6;
      
      private static const const_1040:String = "library";
      
      public static const const_1317:int = 99;
      
      private static const const_1033:String = "library";
      
      private static const const_1035:String = "zip-libraries";
      
      public static const const_1212:int = 10;
      
      public static const const_1140:int = 1;
      
      public static const const_1157:int = 2;
      
      public static const const_1310:int = 20;
      
      private static const const_1038:String = "library";
      
      private static const const_1036:String = "asset-libraries";
      
      public static const const_1231:int = 5;
      
      public static const const_1294:int = 30;
      
      public static const const_518:int = 4;
      
      public static const const_1131:int = 3;
      
      private static const const_1039:String = "service-libraries";
      
      private static const const_1037:String = "component-libraries";
       
      
      private var var_526:Number = 0;
      
      private var var_109:ICoreConfigStatusListener;
      
      private var var_378:uint;
      
      private var var_257:Array;
      
      private var var_256:uint;
      
      private var var_122:DisplayObjectContainer;
      
      private var var_771:Profiler;
      
      private var var_258:Array;
      
      private var var_223:Array;
      
      private var var_527:Array;
      
      private var var_620:Array;
      
      private var var_255:Array;
      
      private var var_619:ProfilerViewer;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_862 = (param2 & 0) != 0;
         var_527 = new Array();
         var_620 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_146)
         {
            var_527.push(new Array());
            var_620.push(0);
            _loc3_++;
         }
         var_378 = getTimer();
         attachComponent(this,[new IIDCore()]);
         var_122 = param1;
         switch(param2 & 0)
         {
            case Core.const_1206:
               debug("Core; using simple frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_829:
               debug("Core; using complex frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1107:
               debug("Core; using profiler frame update handler");
               var_122.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_771 = new Profiler(this);
               attachComponent(var_771,[new IIDProfiler()]);
               var_619 = new ProfilerViewer();
               var_122.addChild(var_619);
         }
      }
      
      override public function removeUpdateReceiver(param1:ICoreUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_146)
         {
            _loc3_ = var_527[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_.splice(_loc2_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_863;
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param2)
         {
            if(param4 != null)
            {
               ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
            }
            ErrorReportStorage.setParameter("error_cat",String(param3));
            ErrorReportStorage.setParameter("error_desc",param1);
         }
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      private function updateConfigStatusListener() : void
      {
         var _loc1_:* = NaN;
         if(var_109)
         {
            _loc1_ = NaN;
            if(var_526 > 0)
            {
               _loc1_ += var_526 + var_223.length - 1;
            }
            else
            {
               _loc1_ += var_223.length;
            }
            var_109.percent = (Number(var_256) - _loc1_) / Number(var_256);
         }
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_378;
         var_378 = msCurrentTime;
         var_771.start();
         criticality = 0;
         while(criticality < CoreComponent.const_146)
         {
            var_620[criticality] = 0;
            receivers = var_527[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_771.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_771.stop();
         var_619.refresh(var_771);
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_378;
         var maxTimePerFrame:uint = 1000 / DisplayObject(var_122).stage.frameRate;
         var_378 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_146)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_620[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_620[criticality] = 0;
               receivers = var_527[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = ICoreUpdateReceiver(receivers[index]);
                  if(receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        if(var_862 && !(e is CrashMeError))
                        {
                           trace(e.getStackTrace());
                           throw e;
                        }
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:ICoreUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_378;
         var_378 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_146)
         {
            var_620[criticality] = 0;
            receivers = var_527[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = ICoreUpdateReceiver(receivers[index]);
               if(receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      public function loadExternalConfigDocument(param1:URLRequest, param2:ICoreConfigStatusListener = null) : void
      {
         if(var_109)
         {
            if(var_109 != param2)
            {
               var_109.dispose();
            }
         }
         if(param2)
         {
            var_109 = param2;
         }
         var _loc3_:AssetLoaderStruct = _assets.loadAssetFromFile("config.xml",param1);
         debug("Loading config document \"" + _loc3_.assetLoader.url + "\"");
         _loc3_.addEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc3_.addEventListener(AssetLoaderEvent.const_45,configLoadedHandler);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_122.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_122.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_122 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_146)
            {
               _loc2_ = var_527[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_223 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_223.pop();
               }
            }
            if(var_255 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_255.pop();
               }
            }
            if(var_257 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_257.pop();
               }
            }
            if(var_258 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_258.pop();
               }
            }
            if(var_619 != null)
            {
               var_619.dispose();
               var_619 = null;
            }
            if(var_109)
            {
               var_109.dispose();
               var_109 = null;
            }
            super.dispose();
         }
      }
      
      public function readConfigDocument(param1:XML, param2:ICoreConfigStatusListener = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_109)
         {
            if(var_109 != param2)
            {
               var_109.dispose();
            }
         }
         if(param2)
         {
            var_109 = param2;
         }
         debug("Parsing config document");
         if(var_223 == null)
         {
            var_223 = new Array();
         }
         _loc3_ = param1.child(const_1035)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1034);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_223.push(_loc6_);
               ++var_256;
            }
         }
         if(var_255 == null)
         {
            var_255 = new Array();
         }
         _loc3_ = param1.child(const_1036)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1040);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_255.push(_loc6_);
               ++var_256;
            }
         }
         if(var_257 == null)
         {
            var_257 = new Array();
         }
         _loc3_ = param1.child(const_1039)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1038);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_257.push(_loc6_);
               ++var_256;
            }
         }
         if(var_258 == null)
         {
            var_258 = new Array();
         }
         _loc3_ = param1.child(const_1037)[0];
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.child(const_1033);
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = _loc5_.attribute("url").toString();
               var_258.push(_loc6_);
               ++var_256;
            }
         }
         if(var_109)
         {
            var_109.percent = 0;
         }
         updateLoadingProcess();
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_223[0] == _loc3_)
                  {
                     var_526 = 0;
                     var_223.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_255[0] == _loc3_)
                  {
                     var_255.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_257[0] == _loc3_)
                  {
                     var_257.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_258[0] == _loc3_)
                  {
                     var_258.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_223.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(ProgressEvent.PROGRESS,updateArchiveLoadingItemProgress);
               debug("Loading zip library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_255.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               var_526 = 1;
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading asset library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_257.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading service library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_258.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               debug("Loading component library " + _loc3_);
            }
            updateConfigStatusListener();
            return;
         }
         if(var_109)
         {
            var_109.complete();
         }
         debug("All libraries loaded, Core is now running");
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\": " + _loc2_.getLastErrorMessage(),true,const_1157);
         updateLoadingProcess(param1);
      }
      
      private function updateArchiveLoadingItemProgress(param1:ProgressEvent) : void
      {
         var_526 = 1 - param1.bytesLoaded / param1.bytesTotal;
         if(var_526 > 0)
         {
            updateConfigStatusListener();
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2133;
      }
      
      override public function registerUpdateReceiver(param1:ICoreUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_146 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_527[param2] as Array;
         _loc3_.push(param1);
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_30,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_45,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_30)
         {
            debug("Config document \"" + _loc2_.assetLoader.url + "\" loaded");
            _loc3_ = _assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            readConfigDocument(_loc4_,var_109);
         }
         else
         {
            error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,const_1140);
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      public function get root() : DisplayObjectContainer
      {
         return var_122;
      }
   }
}
