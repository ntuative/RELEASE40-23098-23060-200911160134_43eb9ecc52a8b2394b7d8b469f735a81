package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1777:int;
      
      private var var_316:Boolean;
      
      private var var_1778:Boolean;
      
      private var var_756:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1778 = param1.readBoolean();
         if(var_1778)
         {
            var_1777 = param1.readInteger();
            var_316 = param1.readBoolean();
         }
         else
         {
            var_756 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_756 != null)
         {
            var_756.dispose();
            var_756 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1777;
      }
      
      public function get owner() : Boolean
      {
         return var_316;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1778;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_756;
      }
   }
}
