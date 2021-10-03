package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1600:Boolean = false;
      
      private var var_1595:Boolean = false;
      
      private var var_1598:String = "";
      
      private var _type:String = "";
      
      private var var_1594:Boolean = false;
      
      private var var_1593:Number = 0;
      
      private var var_1599:Number = 0;
      
      private var var_1592:Number = 0;
      
      private var var_1596:String = "";
      
      private var var_1591:Number = 0;
      
      private var var_1597:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1596 = param2;
         var_1598 = param3;
         var_1599 = param4;
         var_1592 = param5;
         var_1593 = param6;
         var_1591 = param7;
         var_1597 = param8;
         var_1595 = param9;
         var_1594 = param10;
         var_1600 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1597;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1600;
      }
      
      public function get localX() : Number
      {
         return var_1593;
      }
      
      public function get localY() : Number
      {
         return var_1591;
      }
      
      public function get canvasId() : String
      {
         return var_1596;
      }
      
      public function get altKey() : Boolean
      {
         return var_1595;
      }
      
      public function get spriteTag() : String
      {
         return var_1598;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1599;
      }
      
      public function get screenY() : Number
      {
         return var_1592;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1594;
      }
   }
}
