package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1642:Boolean;
      
      private var var_1510:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1642 = Boolean(parseInt(param1.@club));
         var_1510 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1642;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1510;
      }
   }
}
