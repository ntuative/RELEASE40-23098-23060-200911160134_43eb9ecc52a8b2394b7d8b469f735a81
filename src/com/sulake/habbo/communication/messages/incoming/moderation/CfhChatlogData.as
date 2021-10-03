package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_995:int;
      
      private var var_1748:int;
      
      private var var_1380:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1380 = param1.readInteger();
         var_1748 = param1.readInteger();
         var_995 = param1.readInteger();
         var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1380);
      }
      
      public function get reportedUserId() : int
      {
         return var_995;
      }
      
      public function get callerUserId() : int
      {
         return var_1748;
      }
      
      public function get callId() : int
      {
         return var_1380;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_115;
      }
   }
}
