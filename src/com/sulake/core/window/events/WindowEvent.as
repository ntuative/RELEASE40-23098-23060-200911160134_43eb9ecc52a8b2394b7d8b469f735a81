package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_291:String = "WE_CHILD_RESIZED";
      
      public static const const_1194:String = "WE_CLOSE";
      
      public static const const_1133:String = "WE_DESTROY";
      
      public static const const_224:String = "WE_CHANGE";
      
      public static const const_1258:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1514:String = "WE_PARENT_RESIZE";
      
      public static const const_81:String = "WE_UPDATE";
      
      public static const const_1220:String = "WE_MAXIMIZE";
      
      public static const const_392:String = "WE_DESTROYED";
      
      public static const const_780:String = "WE_UNSELECT";
      
      public static const const_1336:String = "WE_MAXIMIZED";
      
      public static const const_1491:String = "WE_UNLOCKED";
      
      public static const const_354:String = "WE_CHILD_REMOVED";
      
      public static const const_197:String = "WE_OK";
      
      public static const const_46:String = "WE_RESIZED";
      
      public static const const_1162:String = "WE_ACTIVATE";
      
      public static const const_256:String = "WE_ENABLED";
      
      public static const const_380:String = "WE_CHILD_RELOCATED";
      
      public static const const_1330:String = "WE_CREATE";
      
      public static const const_515:String = "WE_SELECT";
      
      public static const const_167:String = "";
      
      public static const const_1475:String = "WE_LOCKED";
      
      public static const const_1540:String = "WE_PARENT_RELOCATE";
      
      public static const const_1415:String = "WE_CHILD_REMOVE";
      
      public static const const_1516:String = "WE_CHILD_RELOCATE";
      
      public static const const_1527:String = "WE_LOCK";
      
      public static const const_277:String = "WE_FOCUSED";
      
      public static const const_595:String = "WE_UNSELECTED";
      
      public static const const_940:String = "WE_DEACTIVATED";
      
      public static const const_1286:String = "WE_MINIMIZED";
      
      public static const const_1464:String = "WE_ARRANGED";
      
      public static const const_1428:String = "WE_UNLOCK";
      
      public static const const_1458:String = "WE_ATTACH";
      
      public static const const_1108:String = "WE_OPEN";
      
      public static const const_1147:String = "WE_RESTORE";
      
      public static const const_1544:String = "WE_PARENT_RELOCATED";
      
      public static const const_1315:String = "WE_RELOCATE";
      
      public static const const_1530:String = "WE_CHILD_RESIZE";
      
      public static const const_1461:String = "WE_ARRANGE";
      
      public static const const_1165:String = "WE_OPENED";
      
      public static const const_1274:String = "WE_CLOSED";
      
      public static const const_1489:String = "WE_DETACHED";
      
      public static const const_1442:String = "WE_UPDATED";
      
      public static const const_1130:String = "WE_UNFOCUSED";
      
      public static const const_365:String = "WE_RELOCATED";
      
      public static const const_1177:String = "WE_DEACTIVATE";
      
      public static const const_201:String = "WE_DISABLED";
      
      public static const const_539:String = "WE_CANCEL";
      
      public static const const_519:String = "WE_ENABLE";
      
      public static const const_1342:String = "WE_ACTIVATED";
      
      public static const const_1149:String = "WE_FOCUS";
      
      public static const const_1494:String = "WE_DETACH";
      
      public static const const_1293:String = "WE_RESTORED";
      
      public static const const_1146:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1256:String = "WE_PARENT_RESIZED";
      
      public static const const_1311:String = "WE_CREATED";
      
      public static const const_1424:String = "WE_ATTACHED";
      
      public static const const_1301:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1504:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1288:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1504 = param3;
         var_1288 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1288;
      }
      
      public function get related() : IWindow
      {
         return var_1504;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1288 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
