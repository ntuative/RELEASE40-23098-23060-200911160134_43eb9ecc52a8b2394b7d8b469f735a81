package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1450:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1398:String = "ROE_MOUSE_ENTER";
      
      public static const const_352:String = "ROE_MOUSE_MOVE";
      
      public static const const_1466:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_202:String = "ROE_MOUSE_CLICK";
      
      public static const const_419:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1594:Boolean;
      
      private var var_1600:Boolean;
      
      private var var_1595:Boolean;
      
      private var var_1597:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1595 = param4;
         var_1597 = param5;
         var_1594 = param6;
         var_1600 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1600;
      }
      
      public function get altKey() : Boolean
      {
         return var_1595;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1597;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1594;
      }
   }
}
