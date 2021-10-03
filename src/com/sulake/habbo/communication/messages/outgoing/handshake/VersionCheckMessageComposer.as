package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1829:String;
      
      private var var_1242:String;
      
      private var var_1828:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1828 = param1;
         var_1242 = param2;
         var_1829 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1828,var_1242,var_1829];
      }
      
      public function dispose() : void
      {
      }
   }
}
