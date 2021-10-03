package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1471:int = 2;
      
      public static const const_290:int = 4;
      
      public static const const_1338:int = 1;
      
      public static const const_1187:int = 3;
       
      
      private var var_919:int = 0;
      
      private var var_730:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_919;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_919 = param1.readInteger();
         if(var_919 == 3)
         {
            var_730 = param1.readString();
         }
         else
         {
            var_730 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_919 = 0;
         var_730 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_730;
      }
   }
}
