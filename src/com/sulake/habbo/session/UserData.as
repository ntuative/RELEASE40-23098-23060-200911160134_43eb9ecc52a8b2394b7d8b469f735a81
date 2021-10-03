package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_540:String = "";
      
      private var var_1697:String = "";
      
      private var var_1693:int = 0;
      
      private var var_1696:int = 0;
      
      private var _type:int = 0;
      
      private var var_1695:String = "";
      
      private var var_1200:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1694:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1693 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1695 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_540 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_1200 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1693;
      }
      
      public function set webID(param1:int) : void
      {
         var_1694 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1695;
      }
      
      public function set custom(param1:String) : void
      {
         var_1697 = param1;
      }
      
      public function get figure() : String
      {
         return var_540;
      }
      
      public function get sex() : String
      {
         return var_1200;
      }
      
      public function get custom() : String
      {
         return var_1697;
      }
      
      public function get webID() : int
      {
         return var_1694;
      }
      
      public function set xp(param1:int) : void
      {
         var_1696 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1696;
      }
   }
}
