package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_887:Boolean;
      
      private var var_1047:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_887 = param1.readInteger() > 0;
         var_1047 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_887;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1047;
      }
      
      public function flush() : Boolean
      {
         var_887 = false;
         var_1047 = false;
         return true;
      }
   }
}
