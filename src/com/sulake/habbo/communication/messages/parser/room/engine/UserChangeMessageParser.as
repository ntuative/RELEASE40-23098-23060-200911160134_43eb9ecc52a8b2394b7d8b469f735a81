package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var var_540:String;
      
      private var var_1200:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_1201:String;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _id = param1.readInteger();
         var_540 = param1.readString();
         var_1200 = param1.readString();
         var_1201 = param1.readString();
         return true;
      }
      
      public function get figure() : String
      {
         return var_540;
      }
      
      public function flush() : Boolean
      {
         _id = 0;
         var_540 = "";
         var_1200 = "";
         var_1201 = "";
         return true;
      }
      
      public function get sex() : String
      {
         return var_1200;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get customInfo() : String
      {
         return var_1201;
      }
   }
}
