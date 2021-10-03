package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_122:DisplayObject;
      
      private var var_2188:uint;
      
      private var var_805:IWindowToolTipAgentService;
      
      private var var_804:IWindowMouseScalingService;
      
      private var var_404:IWindowContext;
      
      private var var_803:IWindowFocusManagerService;
      
      private var var_807:IWindowMouseListenerService;
      
      private var var_806:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2188 = 0;
         var_122 = param2;
         var_404 = param1;
         var_806 = new WindowMouseDragger(param2);
         var_804 = new WindowMouseScaler(param2);
         var_807 = new WindowMouseListener(param2);
         var_803 = new FocusManager(param2);
         var_805 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_804;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_803;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_805;
      }
      
      public function dispose() : void
      {
         if(var_806 != null)
         {
            var_806.dispose();
            var_806 = null;
         }
         if(var_804 != null)
         {
            var_804.dispose();
            var_804 = null;
         }
         if(var_807 != null)
         {
            var_807.dispose();
            var_807 = null;
         }
         if(var_803 != null)
         {
            var_803.dispose();
            var_803 = null;
         }
         if(var_805 != null)
         {
            var_805.dispose();
            var_805 = null;
         }
         var_404 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_807;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_806;
      }
   }
}
