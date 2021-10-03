package com.sulake.habbo.tracking.statistics
{
   public class DiscreteDistribution
   {
       
      
      private var var_1715:int;
      
      private var var_249:Array;
      
      public function DiscreteDistribution(param1:int = 8)
      {
         super();
         var_249 = [];
         var_1715 = param1;
      }
      
      public function addDataPoint(param1:Number) : void
      {
         var_249.push(param1);
         if(var_249.length > var_1715)
         {
            var_249.splice(0,1);
         }
      }
      
      public function get mean() : Number
      {
         if(false)
         {
            return 0;
         }
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_249.length)
         {
            _loc1_ += var_249[_loc2_];
            _loc2_++;
         }
         return _loc1_ / 0;
      }
      
      public function get sqrtOfVariance() : Number
      {
         if(mean == 0)
         {
            return 0;
         }
         if(true)
         {
            return 0;
         }
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_249.length)
         {
            _loc1_ += (0 - mean) * (0 - mean);
            _loc2_++;
         }
         return Math.sqrt(_loc1_ / -1);
      }
   }
}
