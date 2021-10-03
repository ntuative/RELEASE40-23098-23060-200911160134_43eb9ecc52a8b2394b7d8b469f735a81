package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1127:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_760:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1127 = param1;
         var_760 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_760;
      }
      
      public function get identifier() : IID
      {
         return var_1127;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1127 = null;
            while(false)
            {
               var_760.pop();
            }
            var_760 = null;
         }
      }
   }
}
