package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1584:int;
      
      private var var_1707:Boolean;
      
      private var var_1633:int;
      
      private var var_1705:String;
      
      private var var_1906:Boolean = false;
      
      private var var_1706:int;
      
      private var var_412:int;
      
      private var var_979:String;
      
      private var var_1702:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1251:int;
      
      private var var_1703:Boolean;
      
      private var var_1907:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1584 = param1;
         var_979 = param2;
         _objId = param3;
         var_1251 = param4;
         var_1705 = param5;
         var_1707 = param6;
         var_1703 = param7;
         var_1706 = param8;
         var_1702 = param9;
         var_1633 = param10;
         var_412 = -1;
      }
      
      public function get songId() : int
      {
         return var_1633;
      }
      
      public function get iconCallbackId() : int
      {
         return var_412;
      }
      
      public function get expiryTime() : int
      {
         return var_1706;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1907 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1906 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_412 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1703;
      }
      
      public function get slotId() : String
      {
         return var_1702;
      }
      
      public function get classId() : int
      {
         return var_1251;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1707;
      }
      
      public function get stuffData() : String
      {
         return var_1705;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1584;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1906;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1907;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_979;
      }
   }
}
