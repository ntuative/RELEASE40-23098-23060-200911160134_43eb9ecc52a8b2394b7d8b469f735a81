package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1862:Number = 0;
      
      private var var_1766:Number = 0;
      
      private var var_1767:Number = 0;
      
      private var var_1863:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1766 = param1;
         var_1767 = param2;
         var_1862 = param3;
         var_1863 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1766;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1862;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1767;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1863;
      }
   }
}
