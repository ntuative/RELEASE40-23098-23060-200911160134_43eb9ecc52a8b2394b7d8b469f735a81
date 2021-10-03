package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.utils.getTimer;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
       
      
      private var var_75:Vector3d;
      
      private var var_2216:Vector3d;
      
      private var var_1304:int = 500;
      
      private var var_216:Vector3d;
      
      private var var_873:Vector3d;
      
      private var var_1540:int;
      
      public function MovingObjectLogic()
      {
         super();
      }
      
      override public function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_873 != null)
         {
            _loc1_ = getTimer() - var_1540;
            if(_loc1_ > var_1304)
            {
               _loc1_ = var_1304;
            }
            _loc2_ = Vector3d.product(var_873,_loc1_ / Number(var_1304));
            _loc3_ = Vector3d.sum(var_75,_loc2_);
            if(object != null)
            {
               object.setLocation(_loc3_);
            }
            if(_loc1_ == var_1304)
            {
               var_873 = null;
            }
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               var_75 = new Vector3d(param1.loc.x,param1.loc.y,param1.loc.z);
               _loc3_ = _loc2_.targetLoc;
               _loc4_ = Vector3d.dif(_loc3_,var_75);
               var_1540 = getTimer();
               var_873 = _loc4_;
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
