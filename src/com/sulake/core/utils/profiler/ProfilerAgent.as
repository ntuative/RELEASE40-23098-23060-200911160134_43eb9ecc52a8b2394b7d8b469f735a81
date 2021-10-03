package com.sulake.core.utils.profiler
{
   import com.sulake.core.runtime.ICoreUpdateReceiver;
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.getQualifiedClassName;
   
   public class ProfilerAgent extends ProfilerAgentTask implements IDisposable
   {
       
      
      protected var var_852:ICoreUpdateReceiver;
      
      public function ProfilerAgent(param1:ICoreUpdateReceiver)
      {
         var_852 = param1;
         var _loc2_:String = getQualifiedClassName(var_852);
         super(_loc2_.slice(_loc2_.lastIndexOf(":") + 1,_loc2_.length));
      }
      
      override public function dispose() : void
      {
         var_852 = null;
         super.dispose();
      }
      
      public function get receiver() : ICoreUpdateReceiver
      {
         return var_852;
      }
      
      public function update(param1:int) : void
      {
         super.start();
         var_852.update(param1);
         super.stop();
      }
   }
}
