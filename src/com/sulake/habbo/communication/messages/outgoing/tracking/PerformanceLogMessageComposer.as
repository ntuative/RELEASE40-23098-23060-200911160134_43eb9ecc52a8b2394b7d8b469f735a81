package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_992:int = 0;
      
      private var var_1244:int = 0;
      
      private var var_2019:String = "";
      
      private var var_993:int = 0;
      
      private var var_2047:String = "";
      
      private var var_2048:int = 0;
      
      private var var_1466:String = "";
      
      private var var_2045:int = 0;
      
      private var var_2046:int = 0;
      
      private var var_2018:String = "";
      
      private var var_2049:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2045 = param1;
         var_2018 = param2;
         var_1466 = param3;
         var_2019 = param4;
         var_2047 = param5;
         if(param6)
         {
            var_1244 = 1;
         }
         else
         {
            var_1244 = 0;
         }
         var_2048 = param7;
         var_2046 = param8;
         var_993 = param9;
         var_2049 = param10;
         var_992 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2045,var_2018,var_1466,var_2019,var_2047,var_1244,var_2048,var_2046,var_993,var_2049,var_992];
      }
      
      public function dispose() : void
      {
      }
   }
}
