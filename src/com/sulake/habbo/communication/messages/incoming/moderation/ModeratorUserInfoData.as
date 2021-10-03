package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1683:int;
      
      private var var_1682:int;
      
      private var var_1687:int;
      
      private var _userName:String;
      
      private var var_1686:int;
      
      private var var_1685:int;
      
      private var var_1684:int;
      
      private var _userId:int;
      
      private var var_618:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1685 = param1.readInteger();
         var_1686 = param1.readInteger();
         var_618 = param1.readBoolean();
         var_1687 = param1.readInteger();
         var_1682 = param1.readInteger();
         var_1683 = param1.readInteger();
         var_1684 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1684;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_618;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1686;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1682;
      }
      
      public function get cautionCount() : int
      {
         return var_1683;
      }
      
      public function get cfhCount() : int
      {
         return var_1687;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1685;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
