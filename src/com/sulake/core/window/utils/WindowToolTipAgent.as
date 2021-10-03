package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_305:Timer;
      
      protected var var_855:String;
      
      protected var var_854:uint;
      
      protected var var_1030:Point;
      
      protected var var_236:IToolTipWindow;
      
      protected var var_1029:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1030 = new Point();
         var_1029 = new Point(20,20);
         var_854 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_305 != null)
         {
            var_305.stop();
            var_305.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_305 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1030);
            if(var_236 != null && true)
            {
               var_236.x = param1 + var_1029.x;
               var_236.y = param2 + var_1029.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_305 != null)
         {
            var_305.reset();
         }
         if(_window && true)
         {
            if(var_236 == null || false)
            {
               var_236 = _window.context.create("undefined::ToolTip",var_855,WindowType.WINDOW_TYPE_TOOLTIP,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_236.x = _loc2_.x + var_1030.x + var_1029.x;
            var_236.y = _loc2_.y + var_1030.y + var_1029.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_855 = IInteractiveWindow(param1).toolTipCaption;
               var_854 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_855 = param1.caption;
               var_854 = 500;
            }
            _mouse.x = var_122.mouseX;
            _mouse.y = var_122.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1030);
            if(var_855 != null && var_855 != "")
            {
               if(var_305 == null)
               {
                  var_305 = new Timer(var_854,1);
                  var_305.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_305.reset();
               var_305.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_236 != null && true)
         {
            var_236.destroy();
            var_236 = null;
         }
      }
   }
}
