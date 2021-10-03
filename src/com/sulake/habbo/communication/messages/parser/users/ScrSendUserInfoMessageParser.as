package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1852:int;
      
      private var var_1115:String;
      
      private var var_1850:int;
      
      private var var_1854:int;
      
      private var var_1853:int;
      
      private var var_1851:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1115;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1851;
      }
      
      public function get responseType() : int
      {
         return var_1854;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1850;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1115 = param1.readString();
         var_1850 = param1.readInteger();
         var_1852 = param1.readInteger();
         var_1853 = param1.readInteger();
         var_1854 = param1.readInteger();
         var_1851 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1852;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1853;
      }
   }
}
