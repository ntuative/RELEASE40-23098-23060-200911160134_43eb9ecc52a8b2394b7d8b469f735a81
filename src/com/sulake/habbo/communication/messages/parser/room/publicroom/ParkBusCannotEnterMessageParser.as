package com.sulake.habbo.communication.messages.parser.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ParkBusCannotEnterMessageParser implements IMessageParser
   {
       
      
      private var var_919:String = "";
      
      public function ParkBusCannotEnterMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_919 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         var_919 = "";
         return true;
      }
      
      public function get reason() : String
      {
         return var_919;
      }
   }
}
