package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1681:Array;
      
      private var var_1680:String;
      
      private var var_1679:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1680 = param1;
         var_1681 = param2;
         var_1679 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1680;
      }
      
      public function get yieldList() : Array
      {
         return var_1681;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1679;
      }
   }
}
