package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_917:IID;
      
      private var var_363:uint;
      
      private var var_1094:IUnknown;
      
      private var var_1095:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_917 = param1;
         var_1095 = getQualifiedClassName(var_917);
         var_1094 = param2;
         var_363 = 0;
      }
      
      public function get iid() : IID
      {
         return var_917;
      }
      
      public function get references() : uint
      {
         return var_363;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_363) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1094;
      }
      
      public function get iis() : String
      {
         return var_1095;
      }
      
      public function reserve() : uint
      {
         return ++var_363;
      }
      
      public function dispose() : void
      {
         var_917 = null;
         var_1095 = null;
         var_1094 = null;
         var_363 = 0;
      }
   }
}
