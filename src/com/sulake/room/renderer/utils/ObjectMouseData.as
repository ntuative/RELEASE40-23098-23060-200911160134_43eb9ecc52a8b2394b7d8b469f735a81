package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1598:String = "";
      
      private var var_153:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1598 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_153 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1598;
      }
      
      public function get objectId() : String
      {
         return var_153;
      }
   }
}
