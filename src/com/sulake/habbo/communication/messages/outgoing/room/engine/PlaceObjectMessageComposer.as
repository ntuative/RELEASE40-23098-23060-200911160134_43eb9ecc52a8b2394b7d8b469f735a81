package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_153:int;
      
      private var var_216:int = 0;
      
      private var _roomId:int;
      
      private var var_90:int = 0;
      
      private var _y:int = 0;
      
      private var var_2051:int;
      
      private var var_2076:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_153 = param1;
         var_2051 = param2;
         var_2076 = param3;
         var_90 = param4;
         _y = param5;
         var_216 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_2051)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
               return [var_153 + " " + var_90 + " " + _y + " " + var_216];
            case RoomObjectCategoryEnum.const_29:
               return [var_153 + " " + var_2076];
            default:
               return [];
         }
      }
   }
}
