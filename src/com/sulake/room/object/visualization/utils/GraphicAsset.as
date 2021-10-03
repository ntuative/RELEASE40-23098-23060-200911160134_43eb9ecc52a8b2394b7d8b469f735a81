package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var _height:int;
      
      private var _width:int;
      
      private var var_892:Boolean;
      
      private var _offsetX:int;
      
      private var var_705:int;
      
      private var _name:String;
      
      private var var_734:IAsset;
      
      private var var_893:Boolean;
      
      public function GraphicAsset(param1:String, param2:IAsset, param3:Boolean, param4:Boolean, param5:int, param6:int)
      {
         var _loc8_:* = null;
         super();
         _name = param1;
         var _loc7_:BitmapDataAsset = param2 as BitmapDataAsset;
         if(_loc7_ != null)
         {
            _loc8_ = _loc7_.content as BitmapData;
         }
         if(_loc8_ != null)
         {
            var_734 = param2;
            _width = _loc8_.width;
            _height = _loc8_.height;
         }
         else
         {
            var_734 = null;
            _width = 0;
            _height = 0;
         }
         var_893 = param3;
         var_892 = param4;
         _offsetX = param5;
         var_705 = param6;
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
      
      public function dispose() : void
      {
         var_734 = null;
      }
      
      public function get offsetX() : int
      {
         if(!var_893)
         {
            return _offsetX;
         }
         return -(_width + _offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!var_892)
         {
            return var_705;
         }
         return -(_height + var_705);
      }
      
      public function get asset() : IAsset
      {
         return var_734;
      }
   }
}
