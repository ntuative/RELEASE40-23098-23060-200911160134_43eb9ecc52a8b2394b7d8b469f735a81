package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FavouriteChangedMessageParser implements IMessageParser
   {
       
      
      private var var_2168:Boolean;
      
      private var var_369:int;
      
      public function FavouriteChangedMessageParser()
      {
         super();
      }
      
      public function get added() : Boolean
      {
         return var_2168;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_369 = param1.readInteger();
         this.var_2168 = param1.readBoolean();
         return true;
      }
      
      public function get flatId() : int
      {
         return var_369;
      }
   }
}
