package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1611:Date;
      
      private var var_1067:Boolean = false;
      
      private var _type:int;
      
      private var var_350:BitmapData;
      
      private var var_268:Boolean = false;
      
      private var var_1070:int;
      
      private var var_495:int = 1;
      
      private var var_886:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_350;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_495;
         if(var_495 < 0)
         {
            var_495 = 0;
         }
         var_886 = var_1070;
         var_268 = false;
         var_1067 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_886 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_268;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_350 = param1;
      }
      
      public function get duration() : int
      {
         return var_1070;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1067;
      }
      
      public function get effectsInInventory() : int
      {
         return var_495;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_350;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_268)
         {
            var_1611 = new Date();
         }
         var_268 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_495 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_268)
         {
            _loc1_ = var_886 - (new Date().valueOf() - var_1611.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_886;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1067 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1070 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
