package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_376:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_668:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_682:String;
      
      private var var_153:int;
      
      private var var_192:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_153 = param2;
         var_192 = param3;
         var_682 = param4;
      }
      
      public function get objectId() : int
      {
         return var_153;
      }
      
      public function get text() : String
      {
         return var_192;
      }
      
      public function get colorHex() : String
      {
         return var_682;
      }
   }
}
