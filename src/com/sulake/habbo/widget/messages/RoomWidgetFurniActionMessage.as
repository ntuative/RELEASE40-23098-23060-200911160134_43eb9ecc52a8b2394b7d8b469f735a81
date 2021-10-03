package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_243:String = "RWFAM_MOVE";
      
      public static const const_712:String = "RWFUAM_ROTATE";
      
      public static const const_548:String = "RWFAM_PICKUP";
       
      
      private var var_1625:int = 0;
      
      private var var_1626:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1625 = param2;
         var_1626 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1625;
      }
      
      public function get method_9() : int
      {
         return var_1626;
      }
   }
}
