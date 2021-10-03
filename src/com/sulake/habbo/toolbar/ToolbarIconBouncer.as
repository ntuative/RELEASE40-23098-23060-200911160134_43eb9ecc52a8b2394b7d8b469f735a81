package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1941:Number;
      
      private var var_549:Number = 0;
      
      private var var_1942:Number;
      
      private var var_550:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1941 = param1;
         var_1942 = param2;
      }
      
      public function update() : void
      {
         var_550 += var_1942;
         var_549 += var_550;
         if(var_549 > 0)
         {
            var_549 = 0;
            var_550 = var_1941 * -1 * var_550;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_550 = param1;
         var_549 = 0;
      }
      
      public function get location() : Number
      {
         return var_549;
      }
   }
}
