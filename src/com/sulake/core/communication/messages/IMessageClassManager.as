package com.sulake.core.communication.messages
{
   public interface IMessageClassManager
   {
       
      
      function getMessageComposerID(param1:IMessageComposer) : int;
      
      function getMessageEventClasses(param1:int) : Array;
      
      function method_7(param1:IMessageConfiguration) : Boolean;
   }
}
