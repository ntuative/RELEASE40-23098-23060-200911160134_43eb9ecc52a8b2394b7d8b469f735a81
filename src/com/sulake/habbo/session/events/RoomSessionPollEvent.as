package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_101:String = "RSPE_POLL_CONTENT";
      
      public static const const_114:String = "RSPE_POLL_OFFER";
      
      public static const const_62:String = "RSPE_POLL_ERROR";
       
      
      private var var_1000:Array = null;
      
      private var var_1255:String = "";
      
      private var var_1049:String;
      
      private var var_1254:String = "";
      
      private var var_999:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_1000;
      }
      
      public function get startMessage() : String
      {
         return var_1255;
      }
      
      public function get summary() : String
      {
         return var_1049;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1255 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_999 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1049 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_999;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1254 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1254;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1000 = param1;
      }
   }
}
