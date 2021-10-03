package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LagWarningReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_1886:int;
      
      private var var_1885:int;
      
      public function LagWarningReportMessageComposer(param1:int, param2:int)
      {
         super();
         var_1886 = param1;
         var_1885 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_1886,var_1885];
      }
   }
}
