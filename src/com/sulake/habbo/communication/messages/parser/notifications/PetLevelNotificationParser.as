package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_540:String;
      
      private var var_1589:int;
      
      private var var_1590:String;
      
      private var var_969:int;
      
      private var var_1096:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1096;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1096 = param1.readInteger();
         var_1590 = param1.readString();
         var_1589 = param1.readInteger();
         var_540 = param1.readString();
         var_969 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1590;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_540;
      }
      
      public function get petType() : int
      {
         return var_969;
      }
      
      public function get level() : int
      {
         return var_1589;
      }
   }
}
