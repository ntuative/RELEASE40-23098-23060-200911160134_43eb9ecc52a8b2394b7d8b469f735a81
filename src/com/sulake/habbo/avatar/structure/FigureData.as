package com.sulake.habbo.avatar.structure
{
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.figure.Palette;
   import com.sulake.habbo.avatar.structure.figure.SetType;
   import flash.utils.Dictionary;
   
   public class FigureData implements IStructureData, IFigureData
   {
       
      
      private var var_921:Dictionary;
      
      private var var_922:Dictionary;
      
      public function FigureData()
      {
         super();
         var_922 = new Dictionary();
         var_921 = new Dictionary();
      }
      
      public function parse(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors[0].palette)
         {
            var_922[String(_loc2_.@id)] = new Palette(_loc2_);
         }
         for each(_loc3_ in param1.sets[0].settype)
         {
            var_921[String(_loc3_.@type)] = new SetType(_loc3_);
         }
         return true;
      }
      
      public function getPalette(param1:int) : IPalette
      {
         return var_922[String(param1)];
      }
      
      public function getSetType(param1:String) : ISetType
      {
         return var_921[param1];
      }
      
      public function append(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         for each(_loc2_ in param1.colors[0].palette)
         {
            _loc4_ = var_922[String(_loc2_.@id)];
            if(_loc4_ == null)
            {
               var_922[String(_loc2_.@id)] = new Palette(_loc2_);
            }
            else
            {
               _loc4_.append(_loc2_);
            }
         }
         for each(_loc3_ in param1.sets[0].settype)
         {
            _loc5_ = var_921[String(_loc3_.@type)];
            if(_loc5_ == null)
            {
               var_921[String(_loc3_.@type)] = new SetType(_loc3_);
            }
            else
            {
               _loc5_.append(_loc3_);
            }
         }
         return false;
      }
   }
}
