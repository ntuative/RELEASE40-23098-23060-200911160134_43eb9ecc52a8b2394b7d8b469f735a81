package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_179:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1646:Boolean = false;
      
      private var var_1644:int = 0;
      
      private var var_1647:int = 0;
      
      private var var_1645:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_179,param5,param6);
         var_1645 = param1;
         var_1647 = param2;
         var_1644 = param3;
         var_1646 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1644;
      }
      
      public function get periodsLeft() : int
      {
         return var_1647;
      }
      
      public function get daysLeft() : int
      {
         return var_1645;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1646;
      }
   }
}
