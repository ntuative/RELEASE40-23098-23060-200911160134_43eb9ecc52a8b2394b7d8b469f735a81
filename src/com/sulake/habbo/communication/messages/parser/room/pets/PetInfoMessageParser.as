package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_540:String;
      
      private var var_1589:int;
      
      private var var_1621:int;
      
      private var var_1616:int;
      
      private var var_2082:int;
      
      private var var_1619:int;
      
      private var var_1096:int;
      
      private var var_2081:int;
      
      private var var_2083:int;
      
      private var var_1615:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1506:int;
      
      private var var_2084:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get maxLevel() : int
      {
         return var_2081;
      }
      
      public function get level() : int
      {
         return var_1589;
      }
      
      public function get energy() : int
      {
         return var_1615;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2082;
      }
      
      public function flush() : Boolean
      {
         var_1096 = -1;
         return true;
      }
      
      public function get nutrition() : int
      {
         return var_1619;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2083;
      }
      
      public function get maxNutrition() : int
      {
         return var_2084;
      }
      
      public function get figure() : String
      {
         return var_540;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1621;
      }
      
      public function get petId() : int
      {
         return var_1096;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1096 = param1.readInteger();
         _name = param1.readString();
         var_1589 = param1.readInteger();
         var_2081 = param1.readInteger();
         var_1616 = param1.readInteger();
         var_2083 = param1.readInteger();
         var_1615 = param1.readInteger();
         var_2082 = param1.readInteger();
         var_1619 = param1.readInteger();
         var_2084 = param1.readInteger();
         var_540 = param1.readString();
         var_1621 = param1.readInteger();
         var_1506 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get experience() : int
      {
         return var_1616;
      }
      
      public function get ownerId() : int
      {
         return var_1506;
      }
   }
}
