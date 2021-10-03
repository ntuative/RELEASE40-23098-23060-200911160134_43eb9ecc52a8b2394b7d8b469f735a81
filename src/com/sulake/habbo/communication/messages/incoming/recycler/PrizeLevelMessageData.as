package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1542:int;
      
      private var var_1058:int;
      
      private var var_603:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1058 = param1.readInteger();
         var_1542 = param1.readInteger();
         var_603 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_603.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1542;
      }
      
      public function get prizes() : Array
      {
         return var_603;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1058;
      }
   }
}
