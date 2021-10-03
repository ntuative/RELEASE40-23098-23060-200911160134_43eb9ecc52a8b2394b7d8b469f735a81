package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_670:String;
      
      private var var_2112:int;
      
      private var var_1295:Boolean;
      
      private var _roomId:int;
      
      private var var_2113:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1295 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_670 = param1.readString();
         var_2113 = param1.readInteger();
         var_2112 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1295;
      }
      
      public function get roomName() : String
      {
         return var_670;
      }
      
      public function get enterMinute() : int
      {
         return var_2112;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2113;
      }
   }
}
