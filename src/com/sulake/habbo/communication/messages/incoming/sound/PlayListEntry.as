package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1633:int;
      
      private var var_1636:int = 0;
      
      private var var_1632:String;
      
      private var var_1634:int;
      
      private var var_1635:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1633 = param1;
         var_1634 = param2;
         var_1635 = param3;
         var_1632 = param4;
      }
      
      public function get length() : int
      {
         return var_1634;
      }
      
      public function get name() : String
      {
         return var_1635;
      }
      
      public function get creator() : String
      {
         return var_1632;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1636;
      }
      
      public function get id() : int
      {
         return var_1633;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1636 = param1;
      }
   }
}
