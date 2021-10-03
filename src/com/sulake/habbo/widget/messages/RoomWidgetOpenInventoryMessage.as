package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_879:String = "inventory_badges";
      
      public static const const_1334:String = "inventory_clothes";
      
      public static const const_1152:String = "inventory_furniture";
      
      public static const const_662:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_849:String = "inventory_effects";
       
      
      private var var_1585:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_662);
         var_1585 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1585;
      }
   }
}
