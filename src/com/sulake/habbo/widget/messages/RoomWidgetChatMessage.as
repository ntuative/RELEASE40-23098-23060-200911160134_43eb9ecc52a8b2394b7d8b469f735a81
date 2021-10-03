package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_118:int = 0;
      
      public static const const_110:int = 1;
      
      public static const const_100:int = 2;
      
      public static const const_602:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1078:int = 0;
      
      private var var_1761:String = "";
      
      private var var_192:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_192 = param2;
         var_1078 = param3;
         var_1761 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1761;
      }
      
      public function get chatType() : int
      {
         return var_1078;
      }
      
      public function get text() : String
      {
         return var_192;
      }
   }
}
