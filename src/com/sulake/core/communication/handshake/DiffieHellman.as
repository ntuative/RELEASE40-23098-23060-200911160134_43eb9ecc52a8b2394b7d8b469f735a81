package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1312:BigInteger;
      
      private var var_973:BigInteger;
      
      private var var_1565:BigInteger;
      
      private var var_1313:BigInteger;
      
      private var var_1564:BigInteger;
      
      private var var_1566:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1312 = param1;
         var_1565 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1564.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1313 = new BigInteger();
         var_1313.fromRadix(param1,param2);
         var_1564 = var_1313.modPow(var_973,var_1312);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1566.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_973 = new BigInteger();
         var_973.fromRadix(param1,param2);
         var_1566 = var_1565.modPow(var_973,var_1312);
         return true;
      }
   }
}
