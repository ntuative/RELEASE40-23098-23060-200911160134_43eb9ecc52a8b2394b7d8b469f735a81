package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1670:String;
      
      private var var_540:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_540 = param1;
         var_1670 = param2;
      }
      
      public function get race() : String
      {
         return var_1670;
      }
      
      public function get figure() : String
      {
         return var_540;
      }
   }
}
