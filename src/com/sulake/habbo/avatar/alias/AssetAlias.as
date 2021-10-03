package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_892:Boolean;
      
      private var _name:String;
      
      private var var_1528:String;
      
      private var var_893:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1528 = String(param1.@link);
         var_893 = Boolean(parseInt(param1.@fliph));
         var_892 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_893;
      }
      
      public function get flipV() : Boolean
      {
         return var_892;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1528;
      }
   }
}
