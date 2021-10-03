package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2155:Boolean;
      
      private var var_1345:int;
      
      private var var_2154:String = "";
      
      private var var_74:ITextFieldWindow;
      
      private var var_2156:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1069:String = "";
      
      private var var_152:IWindowContainer;
      
      private var var_277:Boolean;
      
      private var var_1075:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_74 = param2;
         var_1345 = param3;
         var_1075 = param4;
         if(param5 != null)
         {
            var_277 = true;
            var_1069 = param5;
            var_74.text = param5;
         }
         Util.setProcDirectly(var_74,onInputClick);
         var_74.addEventListener(WindowKeyboardEvent.const_125,checkEnterPress);
         var_74.addEventListener(WindowEvent.const_224,checkMaxLen);
         this.var_2155 = var_74.textBackground;
         this._orgTextBackgroundColor = var_74.textBackgroundColor;
         this.var_2156 = var_74.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(var_1075 != null)
            {
               var_1075();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_1069 != null)
         {
            var_74.text = var_1069;
            var_277 = true;
         }
         else
         {
            var_74.text = "";
            var_277 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_74;
      }
      
      public function restoreBackground() : void
      {
         var_74.textBackground = this.var_2155;
         var_74.textBackgroundColor = this._orgTextBackgroundColor;
         var_74.textColor = this.var_2156;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_277)
         {
            return;
         }
         if(!var_277)
         {
            return;
         }
         var_74.text = var_2154;
         var_277 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_152 != null)
         {
            var_152.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         var_74.textBackground = true;
         var_74.textBackgroundColor = 4294021019;
         var_74.textColor = 4278190080;
         if(this.var_152 == null)
         {
            this.var_152 = IWindowContainer(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this.var_152,"popup_arrow_down",true,null,0);
            IWindowContainer(var_74.parent).addChild(this.var_152);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_152.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         var_152.findChildByName("border").width = _loc2_.width + 15;
         var_152.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         var_74.getLocalPosition(_loc3_);
         this.var_152.x = _loc3_.x;
         this.var_152.y = _loc3_.y - this.var_152.height + 3;
         var _loc4_:IWindow = var_152.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_152.width / 2 - _loc4_.width / 2;
         var_152.x += (0 - 0) / 2;
         this.var_152.visible = true;
      }
      
      public function getText() : String
      {
         if(var_277)
         {
            return var_2154;
         }
         return var_74.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !var_277 && Util.trim(getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         var_277 = false;
         var_74.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > var_1345)
         {
            var_74.text = _loc2_.substring(0,var_1345);
         }
      }
   }
}
