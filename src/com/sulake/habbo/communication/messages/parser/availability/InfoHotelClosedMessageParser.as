package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosedMessageParser implements IMessageParser
   {
       
      
      private var var_1158:Boolean;
      
      private var _openHour:int;
      
      private var var_1152:int;
      
      public function InfoHotelClosedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _openHour = param1.readInteger();
         var_1152 = param1.readInteger();
         var_1158 = param1.readInteger() > 0;
         return true;
      }
      
      public function get userThrownOutAtClose() : Boolean
      {
         return var_1158;
      }
      
      public function flush() : Boolean
      {
         _openHour = 0;
         var_1152 = 0;
         var_1158 = false;
         return true;
      }
      
      public function get openHour() : int
      {
         return _openHour;
      }
      
      public function get openMinute() : int
      {
         return var_1152;
      }
   }
}
