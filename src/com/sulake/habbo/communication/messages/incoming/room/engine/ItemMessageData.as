package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_89:Number = 0;
      
      private var _data:String = "";
      
      private var var_2226:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1825:Boolean = false;
      
      private var var_2227:String = "";
      
      private var _id:int = 0;
      
      private var var_205:Boolean = false;
      
      private var var_216:String = "";
      
      private var var_1827:int = 0;
      
      private var var_1826:int = 0;
      
      private var var_1593:int = 0;
      
      private var var_1591:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1825 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_205)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1825;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_205)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_216;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_205)
         {
            var_1593 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_205)
         {
            var_1827 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_205)
         {
            var_1826 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_205)
         {
            var_216 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_205)
         {
            var_1591 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_205)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1593;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_205)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1827;
      }
      
      public function get wallY() : Number
      {
         return var_1826;
      }
      
      public function get localY() : Number
      {
         return var_1591;
      }
      
      public function setReadOnly() : void
      {
         var_205 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_205)
         {
            var_89 = param1;
         }
      }
   }
}
