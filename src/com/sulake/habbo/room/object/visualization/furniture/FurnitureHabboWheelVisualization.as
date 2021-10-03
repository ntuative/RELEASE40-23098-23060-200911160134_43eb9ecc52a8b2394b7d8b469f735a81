package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1009:int = 31;
      
      private static const const_998:int = 32;
      
      private static const const_729:int = 10;
      
      private static const const_484:int = 20;
       
      
      private var var_509:Boolean = false;
      
      private var var_228:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_228 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_509 = true;
            var_228 = new Array();
            var_228.push(const_1009);
            var_228.push(const_998);
            return;
         }
         if(param1 > 0 && param1 <= const_729)
         {
            if(var_509)
            {
               var_509 = false;
               var_228 = new Array();
               var_228.push(const_729 + param1);
               var_228.push(const_484 + param1);
               var_228.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_228.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
