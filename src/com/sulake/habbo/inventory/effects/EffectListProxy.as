package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_471:int;
      
      private var var_92:EffectsModel;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         var_92 = param1;
         var_471 = param2;
      }
      
      public function getDrawableList() : Array
      {
         return var_92.getEffects(var_471);
      }
      
      public function dispose() : void
      {
         var_92 = null;
      }
   }
}
