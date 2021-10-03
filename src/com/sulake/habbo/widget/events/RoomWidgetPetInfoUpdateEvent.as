package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_133:String = "RWPIUE_PET_INFO";
       
      
      private var var_1589:int;
      
      private var var_1616:int;
      
      private var var_1618:int;
      
      private var var_1619:int;
      
      private var var_1617:int;
      
      private var var_1614:int;
      
      private var var_1615:int;
      
      private var var_969:int;
      
      private var var_1620:int;
      
      private var var_1668:int;
      
      private var _id:int;
      
      private var _petRespect:int;
      
      private var var_1669:Boolean;
      
      private var var_1818:int;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1671:Boolean;
      
      private var _name:String;
      
      private var var_828:int;
      
      private var var_1506:int;
      
      public function RoomWidgetPetInfoUpdateEvent(param1:int, param2:int, param3:String, param4:int, param5:BitmapData, param6:Boolean, param7:int, param8:String, param9:int, param10:Boolean = false, param11:Boolean = false)
      {
         super(RoomWidgetPetInfoUpdateEvent.const_133,param10,param11);
         var_969 = param1;
         var_1818 = param2;
         _name = param3;
         _id = param4;
         _image = param5;
         var_1671 = param6;
         var_1506 = param7;
         _ownerName = param8;
         var_1668 = param9;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1614 = param1;
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1671;
      }
      
      public function get level() : int
      {
         return var_1589;
      }
      
      public function get energy() : int
      {
         return var_1615;
      }
      
      public function set level(param1:int) : void
      {
         var_1589 = param1;
      }
      
      public function get petRace() : int
      {
         return var_1818;
      }
      
      public function set energy(param1:int) : void
      {
         var_1615 = param1;
      }
      
      public function get nutrition() : int
      {
         return var_1619;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         var_828 = param1;
      }
      
      public function get experienceMax() : int
      {
         return var_1617;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get nutritionMax() : int
      {
         return var_1618;
      }
      
      public function get ownerId() : int
      {
         return var_1506;
      }
      
      public function set nutrition(param1:int) : void
      {
         var_1619 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1617 = param1;
      }
      
      public function get roomIndex() : int
      {
         return var_1668;
      }
      
      public function get energyMax() : int
      {
         return var_1620;
      }
      
      public function get levelMax() : int
      {
         return var_1614;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get petRespectLeft() : int
      {
         return var_828;
      }
      
      public function set canOwnerBeKicked(param1:Boolean) : void
      {
         var_1669 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1618 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function set petRespect(param1:int) : void
      {
         _petRespect = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1616 = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return var_1669;
      }
      
      public function get experience() : int
      {
         return var_1616;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1620 = param1;
      }
      
      public function get petType() : int
      {
         return var_969;
      }
   }
}
