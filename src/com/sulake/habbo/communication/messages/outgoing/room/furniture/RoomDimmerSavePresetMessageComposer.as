package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1724:int;
      
      private var var_1721:int;
      
      private var var_1723:Boolean;
      
      private var var_1722:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1725:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1721 = param1;
         var_1724 = param2;
         var_1722 = param3;
         var_1725 = param4;
         var_1723 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1721,var_1724,var_1722,var_1725,int(var_1723)];
      }
      
      public function dispose() : void
      {
      }
   }
}
