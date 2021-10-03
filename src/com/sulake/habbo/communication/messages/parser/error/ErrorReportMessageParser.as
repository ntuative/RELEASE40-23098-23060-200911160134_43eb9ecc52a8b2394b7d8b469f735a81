package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1101:int;
      
      private var var_1042:int;
      
      private var var_1102:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1101;
      }
      
      public function flush() : Boolean
      {
         var_1042 = 0;
         var_1101 = 0;
         var_1102 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1042;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1042 = param1.readInteger();
         var_1101 = param1.readInteger();
         var_1102 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1102;
      }
   }
}
