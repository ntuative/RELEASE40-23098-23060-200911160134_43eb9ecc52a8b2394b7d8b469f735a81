package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_583:int = 2;
      
      public static const const_982:int = 6;
      
      public static const const_672:int = 1;
      
      public static const const_713:int = 3;
      
      public static const const_837:int = 4;
      
      public static const const_721:int = 5;
       
      
      private var var_2077:String;
      
      private var var_899:int;
      
      private var var_1928:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_899 = param2;
         var_1928 = param3;
         var_2077 = param4;
      }
      
      public function get time() : String
      {
         return var_2077;
      }
      
      public function get senderId() : int
      {
         return var_899;
      }
      
      public function get messageText() : String
      {
         return var_1928;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
