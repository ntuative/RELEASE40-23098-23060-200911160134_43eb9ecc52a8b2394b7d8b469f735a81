package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2117:Boolean = false;
      
      private var var_2119:int = 0;
      
      private var var_1858:int = 0;
      
      private var var_2116:int = 0;
      
      private var var_2118:int = 0;
      
      private var var_1861:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_2118 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2119;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2117;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2117 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2119 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1858 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_2118;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2116 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1858;
      }
      
      public function get pixelBalance() : int
      {
         return var_2116;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1861 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1861;
      }
   }
}
