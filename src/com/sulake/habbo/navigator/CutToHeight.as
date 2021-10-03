package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_175:String;
      
      private var var_401:int;
      
      private var var_192:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_175 = param1;
         var_192 = param2;
         var_401 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_192.text = var_175.substring(0,param1) + "...";
         return var_192.textHeight > var_401;
      }
   }
}
