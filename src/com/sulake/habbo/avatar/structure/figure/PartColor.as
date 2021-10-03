package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var _id:int;
      
      private var var_1294:uint;
      
      private var var_864:uint;
      
      private var _index:int;
      
      private var var_1509:int;
      
      private var var_1293:Number;
      
      private var _b:uint;
      
      private var var_1290:Number;
      
      private var var_1292:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_1291:Number;
      
      private var var_1510:Boolean = false;
      
      public function PartColor(param1:XML)
      {
         super();
         _id = parseInt(param1.@id);
         _index = parseInt(param1.@index);
         var_1509 = parseInt(param1.@club);
         var_1510 = Boolean(parseInt(param1.@selectable));
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
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return var_864;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get blueMultiplier() : Number
      {
         return var_1293;
      }
      
      public function get r() : uint
      {
         return var_1294;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1510;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get greenMultiplier() : Number
      {
         return var_1290;
      }
      
      public function get g() : uint
      {
         return var_1292;
      }
      
      public function get redMultiplier() : Number
      {
         return var_1291;
      }
      
      public function get club() : int
      {
         return var_1509;
      }
   }
}
