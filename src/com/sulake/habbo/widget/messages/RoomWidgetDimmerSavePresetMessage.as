package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_560:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1724:int;
      
      private var var_1721:int;
      
      private var var_1982:Boolean;
      
      private var var_896:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_560);
         var_1721 = param1;
         var_1724 = param2;
         _color = param3;
         var_896 = param4;
         var_1982 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1724;
      }
      
      public function get presetNumber() : int
      {
         return var_1721;
      }
      
      public function get brightness() : int
      {
         return var_896;
      }
      
      public function get apply() : Boolean
      {
         return var_1982;
      }
   }
}
