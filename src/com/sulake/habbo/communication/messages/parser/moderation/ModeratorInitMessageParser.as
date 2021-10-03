package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1556:Boolean;
      
      private var var_1308:Array;
      
      private var var_1559:Boolean;
      
      private var var_1562:Boolean;
      
      private var var_1557:Boolean;
      
      private var var_161:Array;
      
      private var var_1563:Boolean;
      
      private var var_1561:Boolean;
      
      private var var_1309:Array;
      
      private var var_1558:Boolean;
      
      private var var_1560:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1560;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1556;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1559;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1563;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1561;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1308;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_161 = [];
         var_1308 = [];
         _roomMessageTemplates = [];
         var_1309 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_161.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1308.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1309.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1563 = param1.readBoolean();
         var_1557 = param1.readBoolean();
         var_1559 = param1.readBoolean();
         var_1562 = param1.readBoolean();
         var_1560 = param1.readBoolean();
         var_1561 = param1.readBoolean();
         var_1556 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1558 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1562;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1309;
      }
      
      public function get issues() : Array
      {
         return var_161;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1558;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1557;
      }
   }
}
