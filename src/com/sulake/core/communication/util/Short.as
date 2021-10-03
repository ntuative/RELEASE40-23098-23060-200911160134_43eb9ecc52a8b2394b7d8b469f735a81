package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_632:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_632 = new ByteArray();
         var_632.writeShort(param1);
         var_632.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_632.position = 0;
         if(false)
         {
            _loc1_ = var_632.readShort();
            var_632.position = 0;
         }
         return _loc1_;
      }
   }
}
