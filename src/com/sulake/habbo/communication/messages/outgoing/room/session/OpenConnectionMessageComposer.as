package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_1662:int;
      
      private var var_1663:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         _roomId = param2;
         var_1663 = param1;
         var_1662 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(var_1663),_roomId,var_1662];
      }
      
      public function dispose() : void
      {
      }
   }
}
