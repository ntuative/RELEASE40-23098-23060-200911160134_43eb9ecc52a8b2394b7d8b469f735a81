package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1295:String = "F";
      
      public static const const_835:String = "M";
       
      
      private var var_90:Number = 0;
      
      private var var_540:String = "";
      
      private var var_2106:int = 0;
      
      private var var_1697:String = "";
      
      private var var_1693:int = 0;
      
      private var var_1696:int = 0;
      
      private var var_1695:String = "";
      
      private var var_1200:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_216:int = 0;
      
      private var var_2107:String = "";
      
      private var _name:String = "";
      
      private var var_1694:int = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_216;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_205)
         {
            var_216 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_205)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2106;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_205)
         {
            var_1693 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2107;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_205)
         {
            var_1695 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_205)
         {
            var_2107 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_205)
         {
            var_1696 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_205)
         {
            var_540 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_205)
         {
            var_2106 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_205)
         {
            var_1200 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1693;
      }
      
      public function get groupID() : String
      {
         return var_1695;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_205)
         {
            var_1694 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_205)
         {
            var_1697 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get sex() : String
      {
         return var_1200;
      }
      
      public function get figure() : String
      {
         return var_540;
      }
      
      public function get webID() : int
      {
         return var_1694;
      }
      
      public function get custom() : String
      {
         return var_1697;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_89 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_205)
         {
            var_90 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_90;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1696;
      }
   }
}
