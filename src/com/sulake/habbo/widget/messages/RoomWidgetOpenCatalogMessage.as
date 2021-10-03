package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_609:String = "RWOCM_CLUB_MAIN";
      
      public static const const_489:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1708:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_489);
         var_1708 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1708;
      }
   }
}
