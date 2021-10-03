package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_592:int = -1;
      
      public static const const_911:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1628:int = -1;
      
      private var var_90:int = 0;
      
      private var var_1071:int = 1;
      
      private var var_706:int = 1;
      
      private var var_1627:Boolean = false;
      
      private var var_1629:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_90 = param2;
         _y = param3;
         var_1627 = param5;
         if(param4 < 0)
         {
            param4 = const_592;
         }
         var_706 = param4;
         var_1071 = param4;
         if(param6 >= 0)
         {
            var_1628 = param6;
            var_1629 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_706 > 0 && param1 > var_706)
         {
            param1 = var_706;
         }
         var_1071 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_706;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1629;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_706 < 0)
         {
            return const_592;
         }
         return var_1071;
      }
      
      public function get activeSequence() : int
      {
         return var_1628;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1627;
      }
      
      public function get x() : int
      {
         return var_90;
      }
   }
}
