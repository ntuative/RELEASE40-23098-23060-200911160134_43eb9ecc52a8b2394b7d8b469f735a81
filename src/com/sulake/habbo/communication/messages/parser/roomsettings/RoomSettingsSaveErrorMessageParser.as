package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1511:int = 9;
      
      public static const const_1456:int = 4;
      
      public static const const_1443:int = 1;
      
      public static const const_1210:int = 10;
      
      public static const const_1520:int = 2;
      
      public static const const_1103:int = 7;
      
      public static const const_1222:int = 11;
      
      public static const const_1394:int = 3;
      
      public static const const_1251:int = 8;
      
      public static const const_1192:int = 5;
      
      public static const const_1426:int = 6;
      
      public static const const_1285:int = 12;
       
      
      private var var_1739:String;
      
      private var _roomId:int;
      
      private var var_1042:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1739;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1042 = param1.readInteger();
         var_1739 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1042;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
