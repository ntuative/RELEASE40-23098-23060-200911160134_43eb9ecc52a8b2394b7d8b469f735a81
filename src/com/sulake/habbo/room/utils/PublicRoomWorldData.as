package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1823:Number = 1;
      
      private var var_199:Number = 1;
      
      private var var_1758:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_1758 = param1;
         var_199 = param2;
         var_1823 = param3;
      }
      
      public function get scale() : Number
      {
         return var_199;
      }
      
      public function get heightScale() : Number
      {
         return var_1823;
      }
   }
}
