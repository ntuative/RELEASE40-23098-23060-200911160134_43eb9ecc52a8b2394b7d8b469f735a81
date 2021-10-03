package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1106:String = "WN_CREATED";
      
      public static const const_846:String = "WN_DISABLE";
      
      public static const const_823:String = "WN_DEACTIVATED";
      
      public static const const_921:String = "WN_OPENED";
      
      public static const const_869:String = "WN_CLOSED";
      
      public static const const_903:String = "WN_DESTROY";
      
      public static const const_1416:String = "WN_ARRANGED";
      
      public static const const_360:String = "WN_PARENT_RESIZED";
      
      public static const const_817:String = "WN_ENABLE";
      
      public static const const_821:String = "WN_RELOCATE";
      
      public static const const_963:String = "WN_FOCUS";
      
      public static const const_985:String = "WN_PARENT_RELOCATED";
      
      public static const const_422:String = "WN_PARAM_UPDATED";
      
      public static const const_700:String = "WN_PARENT_ACTIVATED";
      
      public static const const_223:String = "WN_RESIZED";
      
      public static const const_882:String = "WN_CLOSE";
      
      public static const const_877:String = "WN_PARENT_REMOVED";
      
      public static const const_222:String = "WN_CHILD_RELOCATED";
      
      public static const const_513:String = "WN_ENABLED";
      
      public static const const_241:String = "WN_CHILD_RESIZED";
      
      public static const const_855:String = "WN_MINIMIZED";
      
      public static const const_542:String = "WN_DISABLED";
      
      public static const const_189:String = "WN_CHILD_ACTIVATED";
      
      public static const const_456:String = "WN_STATE_UPDATED";
      
      public static const const_645:String = "WN_UNSELECTED";
      
      public static const const_387:String = "WN_STYLE_UPDATED";
      
      public static const const_1477:String = "WN_UPDATE";
      
      public static const const_389:String = "WN_PARENT_ADDED";
      
      public static const const_684:String = "WN_RESIZE";
      
      public static const const_664:String = "WN_CHILD_REMOVED";
      
      public static const const_1423:String = "";
      
      public static const const_950:String = "WN_RESTORED";
      
      public static const const_315:String = "WN_SELECTED";
      
      public static const const_938:String = "WN_MINIMIZE";
      
      public static const const_856:String = "WN_FOCUSED";
      
      public static const const_1343:String = "WN_LOCK";
      
      public static const const_283:String = "WN_CHILD_ADDED";
      
      public static const const_824:String = "WN_UNFOCUSED";
      
      public static const const_469:String = "WN_RELOCATED";
      
      public static const const_807:String = "WN_DEACTIVATE";
      
      public static const const_1261:String = "WN_CRETAE";
      
      public static const const_791:String = "WN_RESTORE";
      
      public static const const_292:String = "WN_ACTVATED";
      
      public static const const_1327:String = "WN_LOCKED";
      
      public static const const_459:String = "WN_SELECT";
      
      public static const const_801:String = "WN_MAXIMIZE";
      
      public static const const_884:String = "WN_OPEN";
      
      public static const const_666:String = "WN_UNSELECT";
      
      public static const const_1515:String = "WN_ARRANGE";
      
      public static const const_1303:String = "WN_UNLOCKED";
      
      public static const const_1508:String = "WN_UPDATED";
      
      public static const const_843:String = "WN_ACTIVATE";
      
      public static const const_1264:String = "WN_UNLOCK";
      
      public static const const_935:String = "WN_MAXIMIZED";
      
      public static const const_789:String = "WN_DESTROYED";
      
      public static const const_979:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1504,cancelable);
      }
   }
}
