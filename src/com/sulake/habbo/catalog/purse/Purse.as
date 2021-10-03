package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1858:int = 0;
      
      private var var_1860:int = 0;
      
      private var var_1859:int = 0;
      
      private var var_1861:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1860;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1860 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1858 = param1;
      }
      
      public function get credits() : int
      {
         return var_1859;
      }
      
      public function get clubDays() : int
      {
         return var_1858;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1861 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1859 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1861;
      }
   }
}
