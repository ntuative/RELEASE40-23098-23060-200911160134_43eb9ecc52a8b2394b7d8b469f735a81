package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1589:int;
      
      private var var_1616:int;
      
      private var var_1618:int;
      
      private var _type:int;
      
      private var var_1096:int = -1;
      
      private var var_1614:int;
      
      private var var_1619:int;
      
      private var var_1617:int;
      
      private var var_1615:int;
      
      private var var_1670:int;
      
      private var var_1620:int;
      
      private var var_1668:int;
      
      private var _petRespect:int;
      
      private var var_1669:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1671:Boolean;
      
      private var var_1506:int;
      
      private var _name:String = "";
      
      public function InfoStandPetData()
      {
         super();
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
      
      public function get nutrition() : int
      {
         return var_1619;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1617;
      }
      
      public function get id() : int
      {
         return var_1096;
      }
      
      public function get nutritionMax() : int
      {
         return var_1618;
      }
      
      public function get ownerId() : int
      {
         return var_1506;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1096 = param1.id;
         _type = param1.petType;
         var_1670 = param1.petRace;
         _image = param1.image;
         var_1671 = param1.isOwnPet;
         var_1506 = param1.ownerId;
         _ownerName = param1.ownerName;
         var_1669 = param1.canOwnerBeKicked;
         var_1589 = param1.level;
         var_1614 = param1.levelMax;
         var_1616 = param1.experience;
         var_1617 = param1.experienceMax;
         var_1615 = param1.energy;
         var_1620 = param1.energyMax;
         var_1619 = param1.nutrition;
         var_1618 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_1668 = param1.roomIndex;
      }
      
      public function get roomIndex() : int
      {
         return var_1668;
      }
      
      public function get type() : int
      {
         return _type;
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
      
      public function get race() : int
      {
         return var_1670;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get experience() : int
      {
         return var_1616;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return var_1669;
      }
   }
}
