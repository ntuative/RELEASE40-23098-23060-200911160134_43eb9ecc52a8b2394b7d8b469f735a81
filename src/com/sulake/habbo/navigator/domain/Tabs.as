package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_656:int = 6;
      
      public static const const_183:int = 5;
      
      public static const const_709:int = 2;
      
      public static const const_294:int = 9;
      
      public static const const_253:int = 4;
      
      public static const const_247:int = 2;
      
      public static const const_516:int = 4;
      
      public static const const_195:int = 8;
      
      public static const const_520:int = 7;
      
      public static const const_261:int = 3;
      
      public static const const_324:int = 1;
      
      public static const const_194:int = 5;
      
      public static const const_444:int = 12;
      
      public static const const_271:int = 1;
      
      public static const const_445:int = 11;
      
      public static const const_586:int = 3;
      
      public static const const_1531:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_388:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_388 = new Array();
         var_388.push(new Tab(_navigator,const_324,const_444,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_427));
         var_388.push(new Tab(_navigator,const_247,const_271,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_427));
         var_388.push(new Tab(_navigator,const_253,const_445,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_523));
         var_388.push(new Tab(_navigator,const_261,const_183,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_427));
         var_388.push(new Tab(_navigator,const_194,const_195,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_550));
         setSelectedTab(const_324);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_388)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_388)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_388)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_253;
      }
      
      public function get tabs() : Array
      {
         return var_388;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
