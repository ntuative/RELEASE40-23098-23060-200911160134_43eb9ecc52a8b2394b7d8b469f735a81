package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_106:String = "RSPE_VOTE_RESULT";
      
      public static const const_122:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1189:int = 0;
      
      private var var_976:String = "";
      
      private var var_657:Array;
      
      private var var_871:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_871 = [];
         var_657 = [];
         super(param1,param2,param7,param8);
         var_976 = param3;
         var_871 = param4;
         var_657 = param5;
         if(var_657 == null)
         {
            var_657 = [];
         }
         var_1189 = param6;
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
