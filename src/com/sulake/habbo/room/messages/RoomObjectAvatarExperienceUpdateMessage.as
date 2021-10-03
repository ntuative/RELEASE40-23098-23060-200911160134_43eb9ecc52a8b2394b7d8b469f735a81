package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1652:int;
      
      public function RoomObjectAvatarExperienceUpdateMessage(param1:int)
      {
         super();
         var_1652 = param1;
      }
      
      public function get method_3() : int
      {
         return var_1652;
      }
   }
}
