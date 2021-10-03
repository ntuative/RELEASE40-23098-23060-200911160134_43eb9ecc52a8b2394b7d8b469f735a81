package com.sulake.core.communication.messages
{
   import com.sulake.core.communication.protocol.IProtocolDecoder;
   import com.sulake.core.communication.util.Short;
   import flash.utils.ByteArray;
   
   public class MessageDataWrapper implements IMessageDataWrapper
   {
       
      
      private var var_794:IProtocolDecoder;
      
      private var _data:ByteArray;
      
      public function MessageDataWrapper(param1:ByteArray, param2:IProtocolDecoder)
      {
         super();
         _data = param1;
         var_794 = param2;
      }
      
      public function readShort() : Short
      {
         return var_794.readShort(_data);
      }
      
      public function readString() : String
      {
         return var_794.readString(_data);
      }
      
      public function readInteger() : int
      {
         return var_794.readInteger(_data);
      }
      
      public function readBoolean() : Boolean
      {
         return var_794.readBoolean(_data);
      }
      
      public function get bytesAvailable() : uint
      {
         return _data.bytesAvailable;
      }
   }
}
