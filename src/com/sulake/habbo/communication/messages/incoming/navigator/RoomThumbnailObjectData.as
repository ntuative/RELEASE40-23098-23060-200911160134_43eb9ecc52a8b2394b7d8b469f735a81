package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1323:int;
      
      private var var_1324:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1323;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1323 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1323 = this.var_1323;
         _loc1_.var_1324 = this.var_1324;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1324 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1324;
      }
   }
}
