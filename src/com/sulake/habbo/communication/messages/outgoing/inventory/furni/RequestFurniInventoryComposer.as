package com.sulake.habbo.communication.messages.outgoing.inventory.furni
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RequestFurniInventoryComposer implements IMessageComposer
   {
       
      
      private var var_2033:int = 0;
      
      private var var_1964:int = 0;
      
      public function RequestFurniInventoryComposer(param1:int, param2:int)
      {
         super();
         var_2033 = param1;
         var_1964 = param2;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(var_2033,var_1964);
         return _loc1_;
      }
      
      public function dispose() : void
      {
      }
   }
}
