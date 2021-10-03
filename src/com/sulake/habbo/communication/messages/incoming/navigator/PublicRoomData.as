package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1583:int;
      
      private var var_1986:String;
      
      private var var_1532:int;
      
      private var _disposed:Boolean;
      
      private var var_1987:int;
      
      private var var_1531:String;
      
      private var var_1120:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1531 = param1.readString();
         var_1583 = param1.readInteger();
         var_1532 = param1.readInteger();
         var_1986 = param1.readString();
         var_1987 = param1.readInteger();
         var_1120 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1987;
      }
      
      public function get worldId() : int
      {
         return var_1532;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1531;
      }
      
      public function get unitPort() : int
      {
         return var_1583;
      }
      
      public function get castLibs() : String
      {
         return var_1986;
      }
      
      public function get nodeId() : int
      {
         return var_1120;
      }
   }
}
