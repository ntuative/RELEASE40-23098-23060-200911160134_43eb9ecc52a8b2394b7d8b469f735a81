package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_2065:int = -1;
      
      private var var_1073:int = -1;
      
      private var var_676:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_676 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_2065;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_2065 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_676.assign(param1);
         var_676.x = Math.round(var_676.x);
         var_676.y = Math.round(var_676.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1073 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_676;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1073;
      }
   }
}
