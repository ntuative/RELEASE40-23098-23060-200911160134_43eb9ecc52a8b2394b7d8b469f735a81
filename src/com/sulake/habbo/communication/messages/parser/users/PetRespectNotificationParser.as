package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1621:int;
      
      private var var_1159:PetData;
      
      private var var_1870:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1621;
      }
      
      public function get petData() : PetData
      {
         return var_1159;
      }
      
      public function flush() : Boolean
      {
         var_1159 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1870;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1621 = param1.readInteger();
         var_1870 = param1.readInteger();
         var_1159 = new PetData(param1);
         return true;
      }
   }
}
