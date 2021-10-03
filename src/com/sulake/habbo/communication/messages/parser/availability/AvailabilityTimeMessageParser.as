package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_887:Boolean;
      
      private var var_1147:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_887 = param1.readInteger() > 0;
         var_1147 = param1.readInteger();
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_887;
      }
      
      public function flush() : Boolean
      {
         var_887 = false;
         var_1147 = 0;
         return true;
      }
      
      public function get minutesUntilChange() : int
      {
         return var_1147;
      }
   }
}
