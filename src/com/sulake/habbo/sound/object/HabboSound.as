package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_912:SoundChannel = null;
      
      private var var_724:Boolean;
      
      private var var_913:Sound = null;
      
      private var var_667:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_913 = param1;
         var_913.addEventListener(Event.COMPLETE,onComplete);
         var_667 = 1;
         var_724 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_724;
      }
      
      public function stop() : Boolean
      {
         var_912.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_724 = false;
         var_912 = var_913.play(0);
         this.volume = var_667;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_667;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_912.position;
      }
      
      public function get length() : Number
      {
         return var_913.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_667 = param1;
         if(var_912 != null)
         {
            var_912.soundTransform = new SoundTransform(var_667);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_724 = true;
      }
   }
}
