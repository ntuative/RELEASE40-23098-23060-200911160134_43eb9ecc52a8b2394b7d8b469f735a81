package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupDetailsMessageParser implements IMessageParser
   {
       
      
      private var var_670:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_982:int = -1;
      
      private var var_1037:String = "";
      
      public function HabboGroupDetailsMessageParser()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return var_982;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_982 = param1.readInteger();
         if(var_982 != -1)
         {
            _name = param1.readString();
            var_1037 = param1.readString();
            _roomId = param1.readInteger();
            var_670 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_982 = -1;
         _name = "";
         var_1037 = "";
         _roomId = -1;
         var_670 = "";
         return true;
      }
      
      public function get roomName() : String
      {
         return var_670;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return var_1037;
      }
   }
}
