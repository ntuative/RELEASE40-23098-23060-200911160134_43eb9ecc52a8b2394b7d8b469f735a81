package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_825:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_825 = new Array();
         var_825.push(param1.length);
         var_825 = var_825.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_825;
      }
   }
}
