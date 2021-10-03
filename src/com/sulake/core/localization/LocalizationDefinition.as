package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1341:String;
      
      private var var_851:String;
      
      private var var_1340:String;
      
      private var var_1339:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1339 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1341 = _loc5_[0];
         var_1340 = _loc5_[1];
         _name = param2;
         var_851 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1341;
      }
      
      public function get languageCode() : String
      {
         return var_1339;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_851;
      }
      
      public function get encoding() : String
      {
         return var_1340;
      }
      
      public function get id() : String
      {
         return var_1339 + "_" + var_1341 + "." + var_1340;
      }
   }
}
