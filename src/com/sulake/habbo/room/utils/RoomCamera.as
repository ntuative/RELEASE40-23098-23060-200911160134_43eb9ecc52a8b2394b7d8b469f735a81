package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_328:Number = 0.5;
      
      private static const const_726:int = 3;
      
      private static const const_994:Number = 1;
       
      
      private var var_1605:Boolean = false;
      
      private var _targetCategory:int = -2;
      
      private var var_1609:Boolean = false;
      
      private var var_1606:Boolean = false;
      
      private var var_1607:Boolean = false;
      
      private var var_1608:int = -1;
      
      private var var_883:int = 0;
      
      private var var_241:Vector3d = null;
      
      private var var_357:Vector3d = null;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1609;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1606;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_357 != null && var_241 != null)
         {
            ++var_883;
            _loc2_ = Vector3d.dif(var_357,var_241);
            if(_loc2_.length <= const_328)
            {
               var_241 = var_357;
               var_357 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_328 * (const_726 + 1))
               {
                  _loc2_.mul(const_328);
               }
               else if(var_883 <= const_726)
               {
                  _loc2_.mul(const_328);
               }
               else
               {
                  _loc2_.mul(const_994);
               }
               var_241 = Vector3d.sum(var_241,_loc2_);
            }
         }
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1609 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1607 = param1;
      }
      
      public function get targetId() : int
      {
         return var_1608;
      }
      
      public function set targetCategory(param1:int) : void
      {
         _targetCategory = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_357 == null)
         {
            var_357 = new Vector3d();
         }
         var_357.assign(param1);
         var_883 = 0;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1606 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_241 != null)
         {
            return;
         }
         var_241 = new Vector3d();
         var_241.assign(param1);
      }
      
      public function set targetId(param1:int) : void
      {
         var_1608 = param1;
      }
      
      public function dispose() : void
      {
         var_357 = null;
         var_241 = null;
      }
      
      public function get targetCategory() : int
      {
         return _targetCategory;
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1605;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1607;
      }
      
      public function get location() : IVector3d
      {
         return var_241;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1605 = param1;
      }
   }
}
