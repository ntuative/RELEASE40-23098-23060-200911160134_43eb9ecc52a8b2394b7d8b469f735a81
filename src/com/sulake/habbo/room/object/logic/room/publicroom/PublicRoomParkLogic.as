package com.sulake.habbo.room.object.logic.room.publicroom
{
   import com.sulake.habbo.room.events.RoomObjectRoomActionEvent;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class PublicRoomParkLogic extends PublicRoomLogic
   {
      
      private static const const_990:String = "bus_oviopen_hidden";
      
      private static const const_988:String = "goawaybus";
      
      private static const const_989:String = "bus";
       
      
      public function PublicRoomParkLogic()
      {
         super();
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         super.mouseEvent(param1,param2);
         var _loc3_:RoomSpriteMouseEvent = param1;
         if(_loc3_ == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc4_:int = object.getId();
         var _loc5_:String = object.getType();
         var _loc6_:* = null;
         switch(_loc3_.type)
         {
            case MouseEvent.CLICK:
               switch(_loc3_.spriteTag)
               {
                  case const_988:
                     _loc6_ = new RoomObjectRoomActionEvent(RoomObjectRoomActionEvent.const_353,0,_loc4_,_loc5_);
                     break;
                  case const_989:
                  case const_990:
                     _loc6_ = new RoomObjectRoomActionEvent(RoomObjectRoomActionEvent.const_370,0,_loc4_,_loc5_);
               }
         }
         if(eventDispatcher != null)
         {
            if(_loc6_ != null)
            {
               eventDispatcher.dispatchEvent(_loc6_);
            }
         }
      }
   }
}
