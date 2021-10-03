package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_106:String = "RWPUE_VOTE_RESULT";
      
      public static const const_122:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1189:int;
      
      private var var_976:String;
      
      private var var_657:Array;
      
      private var var_871:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_976 = param2;
         var_871 = param3;
         var_657 = param4;
         if(var_657 == null)
         {
            var_657 = [];
         }
         var_1189 = param5;
      }
      
      public function get votes() : Array
      {
         return var_657.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1189;
      }
      
      public function get question() : String
      {
         return var_976;
      }
      
      public function get choices() : Array
      {
         return var_871.slice();
      }
   }
}
