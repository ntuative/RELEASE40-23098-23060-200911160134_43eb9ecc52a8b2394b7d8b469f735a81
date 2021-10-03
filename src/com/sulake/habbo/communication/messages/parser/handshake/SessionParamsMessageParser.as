package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_1284:Boolean;
      
      protected var var_2139:Boolean;
      
      protected var var_1282:Boolean;
      
      protected var var_640:String;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2138:String;
      
      protected var var_2137:Boolean;
      
      protected var var_1283:Boolean;
      
      protected var var_1280:Boolean;
      
      protected var var_1281:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return var_2139;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return var_1283;
      }
      
      public function flush() : Boolean
      {
         var_1281 = false;
         var_1280 = false;
         var_640 = "";
         var_1283 = false;
         var_1284 = false;
         var_1282 = false;
         _confPartnerIntegration = false;
         var_2137 = false;
         var_2138 = "";
         var_2139 = false;
         return true;
      }
      
      public function get tracking_header() : String
      {
         return var_2138;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return var_1284;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return var_2137;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return var_1282;
      }
      
      public function get voucher() : Boolean
      {
         return var_1280;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return _confPartnerIntegration;
      }
      
      public function get coppa() : Boolean
      {
         return var_1281;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  var_1281 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  var_1280 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  var_1283 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  var_1284 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  var_1282 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get date() : String
      {
         return var_640;
      }
   }
}
