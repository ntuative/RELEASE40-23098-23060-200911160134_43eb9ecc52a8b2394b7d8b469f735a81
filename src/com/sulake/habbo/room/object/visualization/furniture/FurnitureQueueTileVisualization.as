package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1008:int = 1;
      
      private static const const_998:int = 3;
      
      private static const const_1007:int = 2;
      
      private static const const_1006:int = 15;
       
      
      private var var_716:int;
      
      private var var_228:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_228 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1007)
         {
            var_228 = new Array();
            var_228.push(const_1008);
            var_716 = const_1006;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_716 > 0)
         {
            --var_716;
         }
         if(var_716 == 0)
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
