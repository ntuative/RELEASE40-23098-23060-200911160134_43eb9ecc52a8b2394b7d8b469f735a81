package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1189:int;
      
      private var var_976:String;
      
      private var var_657:Array;
      
      private var var_871:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_657.slice();
      }
      
      public function flush() : Boolean
      {
         var_976 = "";
         var_871 = [];
         var_657 = [];
         var_1189 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1189;
      }
      
      public function get question() : String
      {
         return var_976;
      }
      
      public function get choices() : Array
      {
         return var_871.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_976 = param1.readString();
         var_871 = [];
         var_657 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_871.push(param1.readString());
            var_657.push(param1.readInteger());
            _loc3_++;
         }
         var_1189 = param1.readInteger();
         return true;
      }
   }
}
