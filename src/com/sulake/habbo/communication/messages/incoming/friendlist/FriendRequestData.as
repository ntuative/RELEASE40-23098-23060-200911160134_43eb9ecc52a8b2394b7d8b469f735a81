package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1844:int;
      
      private var var_1843:String;
      
      private var var_1082:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1082 = param1.readInteger();
         this.var_1843 = param1.readString();
         this.var_1844 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1082;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1844;
      }
      
      public function get requesterName() : String
      {
         return this.var_1843;
      }
   }
}
