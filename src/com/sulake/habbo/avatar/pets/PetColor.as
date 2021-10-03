package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var var_1294:uint;
      
      private var var_864:uint;
      
      private var var_1837:int;
      
      private var var_1293:Number;
      
      private var _b:uint;
      
      private var var_1290:Number;
      
      private var var_1292:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_1291:Number;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         var_864 = parseInt(_loc2_,16);
         var_1294 = var_864 >> 16 & 255;
         var_1292 = var_864 >> 8 & 255;
         _b = var_864 >> 0 & 255;
         var_1291 = var_1294 / 255 * 1;
         var_1290 = var_1292 / 255 * 1;
         var_1293 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1291,var_1290,var_1293);
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         var_1837 = param1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return var_864;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return var_1837;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get g() : uint
      {
         return var_1292;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get r() : uint
      {
         return var_1294;
      }
   }
}
