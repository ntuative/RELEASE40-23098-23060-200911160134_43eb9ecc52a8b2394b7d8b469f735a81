package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1712:String;
      
      private var var_369:int;
      
      private var var_1713:String;
      
      private var var_1709:String;
      
      private var var_1710:int;
      
      private var var_1711:String;
      
      private var var_1714:int;
      
      private var var_571:Array;
      
      private var var_944:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_571 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_944 = false;
            return;
         }
         this.var_944 = true;
         var_1710 = int(_loc2_);
         var_1713 = param1.readString();
         var_369 = int(param1.readString());
         var_1714 = param1.readInteger();
         var_1712 = param1.readString();
         var_1709 = param1.readString();
         var_1711 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_571.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1714;
      }
      
      public function get eventName() : String
      {
         return var_1712;
      }
      
      public function get eventDescription() : String
      {
         return var_1709;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1713;
      }
      
      public function get tags() : Array
      {
         return var_571;
      }
      
      public function get creationTime() : String
      {
         return var_1711;
      }
      
      public function get exists() : Boolean
      {
         return var_944;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1710;
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
         this.var_571 = null;
      }
      
      public function get flatId() : int
      {
         return var_369;
      }
   }
}
