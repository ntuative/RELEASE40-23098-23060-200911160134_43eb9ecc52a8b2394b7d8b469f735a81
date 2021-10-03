package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2179:Boolean;
      
      private var var_2181:int;
      
      private var var_2180:Boolean;
      
      private var var_1399:String;
      
      private var var_1226:String;
      
      private var var_1835:int;
      
      private var var_1812:String;
      
      private var var_2182:String;
      
      private var var_1811:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1835 = param1.readInteger();
         this.var_1399 = param1.readString();
         this.var_1812 = param1.readString();
         this.var_2179 = param1.readBoolean();
         this.var_2180 = param1.readBoolean();
         param1.readString();
         this.var_2181 = param1.readInteger();
         this.var_1811 = param1.readString();
         this.var_2182 = param1.readString();
         this.var_1226 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1226;
      }
      
      public function get avatarName() : String
      {
         return this.var_1399;
      }
      
      public function get avatarId() : int
      {
         return this.var_1835;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2179;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2182;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1811;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2180;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1812;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2181;
      }
   }
}
