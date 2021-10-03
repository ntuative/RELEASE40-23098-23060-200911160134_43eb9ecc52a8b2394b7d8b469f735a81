package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CanCreateRoomEventMessageParser implements IMessageParser
   {
       
      
      private var var_1042:int;
      
      private var var_2178:Boolean;
      
      public function CanCreateRoomEventMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2178 = param1.readBoolean();
         this.var_1042 = param1.readInteger();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1042;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get canCreateEvent() : Boolean
      {
         return var_2178;
      }
   }
}
