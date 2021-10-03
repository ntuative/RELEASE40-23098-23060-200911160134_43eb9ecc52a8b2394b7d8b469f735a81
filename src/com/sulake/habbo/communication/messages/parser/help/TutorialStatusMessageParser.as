package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_874:Boolean;
      
      private var var_876:Boolean;
      
      private var var_875:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_874;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_876;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_875 = param1.readBoolean();
         var_876 = param1.readBoolean();
         var_874 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_875;
      }
      
      public function flush() : Boolean
      {
         var_875 = false;
         var_876 = false;
         var_874 = false;
         return true;
      }
   }
}
