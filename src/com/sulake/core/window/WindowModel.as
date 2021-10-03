package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_348:Rectangle;
      
      protected var var_30:uint;
      
      protected var var_148:Rectangle;
      
      protected var _type:uint;
      
      protected var var_688:Boolean;
      
      protected var var_147:Rectangle;
      
      protected var var_411:uint;
      
      protected var _state:uint;
      
      protected var var_86:uint;
      
      protected var var_310:Boolean;
      
      protected var var_235:String;
      
      protected var var_79:WindowRectLimits;
      
      protected var _alphaColor:uint;
      
      protected var var_5:Boolean;
      
      protected var var_372:Number;
      
      protected var var_59:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_22:Rectangle;
      
      protected var _context:WindowContext;
      
      protected var var_571:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:String, param4:uint, param5:uint, param6:uint, param7:WindowContext, param8:Rectangle, param9:Array = null)
      {
         super();
         _id = param1;
         _name = param2;
         _type = param4;
         var_30 = param6;
         _state = WindowState.const_78;
         var_86 = param5;
         var_571 = param9 == null ? new Array() : param9;
         var_235 = param3;
         _context = param7;
         var_22 = param8.clone();
         var_348 = param8.clone();
         var_59 = param8.clone();
         var_147 = new Rectangle();
         var_148 = null;
         var_372 = 1;
         var_79 = new WindowRectLimits(this as IWindow);
         var_310 = true;
         var_688 = true;
         var_5 = false;
         var_411 = 16777215;
      }
      
      public function getMinHeight() : int
      {
         return var_79.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_type & param2 ^ param1) == 0;
         }
         return (_type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return var_79.minWidth;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get param() : uint
      {
         return var_30;
      }
      
      public function get state() : uint
      {
         return _state;
      }
      
      public function getMaximizedWidth() : int
      {
         return var_148.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return var_147.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return var_79;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (_state & param2 ^ param1) == 0;
         }
         return (_state & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_22 = null;
            _state = WindowState.const_455;
            _disposed = true;
            var_571 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get height() : int
      {
         return var_22.height;
      }
      
      public function get position() : Point
      {
         return var_22.topLeft;
      }
      
      public function get background() : Boolean
      {
         return var_5;
      }
      
      public function get context() : IWindowContext
      {
         return _context;
      }
      
      public function getMaximizedHeight() : int
      {
         return var_148.height;
      }
      
      public function get style() : uint
      {
         return var_86;
      }
      
      public function getMaxWidth() : int
      {
         return var_79.maxWidth;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_86 & param2 ^ param1) == 0;
         }
         return (var_86 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (var_30 & param2 ^ param1) == 0;
         }
         return (var_30 & param1) == param1;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return false;
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function get clipping() : Boolean
      {
         return var_688;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_79.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return var_22.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return false;
      }
      
      public function get blend() : Number
      {
         return var_372;
      }
      
      public function getInitialHeight() : int
      {
         return var_348.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return var_147.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_79.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return var_348.width;
      }
      
      public function getPreviousWidth() : int
      {
         return var_59.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return false;
      }
      
      public function get color() : uint
      {
         return var_411;
      }
      
      public function get caption() : String
      {
         return var_235;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = 0;
         var_79.maxHeight = param1;
         return _loc2_;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_22;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = 0;
         var_79.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return var_310;
      }
      
      public function getMaxHeight() : int
      {
         return var_79.maxHeight;
      }
      
      public function get x() : int
      {
         return var_22.x;
      }
      
      public function get y() : int
      {
         return var_22.y;
      }
      
      public function getPreviousHeight() : int
      {
         return var_59.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return false;
      }
   }
}
