package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_391:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_286:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_738:int;
      
      private var var_268:Boolean;
      
      private var var_1742:Boolean;
      
      private var var_1402:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_738 = param2;
         var_1742 = param3;
         var_268 = param4;
         var_1402 = param5;
      }
      
      public function get position() : int
      {
         return var_738;
      }
      
      public function get isActive() : Boolean
      {
         return var_268;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1402;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1742;
      }
   }
}
