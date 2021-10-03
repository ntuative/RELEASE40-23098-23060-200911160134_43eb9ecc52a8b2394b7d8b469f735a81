package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_502:int = 8;
      
      public static const const_1404:int = 10;
      
      public static const const_1112:int = 6;
      
      private static var var_971:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1278:int = 0;
      
      public static const const_1449:int = 1;
      
      public static const const_1513:int = 2;
      
      public static const const_1459:int = 3;
      
      public static const const_1473:int = 4;
      
      public static const const_1504:int = 5;
      
      public static const const_1502:int = 9;
      
      public static const const_1425:int = 7;
       
      
      private var var_171:uint = 0;
      
      private var var_972:uint = 0;
      
      private var var_640:Date;
      
      private var var_1900:int = -1;
      
      private var parseFunc:Function;
      
      private var var_465:Boolean = false;
      
      private var var_2186:int = -1;
      
      private var var_1179:uint = 0;
      
      private var var_1899:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_797:uint;
      
      private var var_33:ByteArray;
      
      private var var_641:uint;
      
      private var var_1430:Boolean = false;
      
      private var var_2185:int = -1;
      
      private var var_1429:String = "2.0";
      
      private var var_170:Boolean = false;
      
      private var var_1901:Boolean = false;
      
      private var var_336:String;
      
      private var var_544:uint = 0;
      
      private var var_1180:int = 0;
      
      private var var_387:String = "";
      
      private var var_642:int = 8;
      
      private var var_1431:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_336 = param1;
         _extraFields = new Dictionary();
         var_33 = new ByteArray();
         var_33.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_544;
      }
      
      public function set filename(param1:String) : void
      {
         var_387 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_170 && false)
         {
            var_33.position = 0;
            if(var_971)
            {
               var_33.uncompress.apply(var_33,["deflate"]);
            }
            else
            {
               var_33.uncompress();
            }
            var_33.position = 0;
            var_170 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_387;
      }
      
      public function get date() : Date
      {
         return var_640;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1431)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_171 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_171)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1429;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_170)
         {
            uncompress();
         }
         var_33.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_33.readUTFBytes(var_33.bytesAvailable);
         }
         else
         {
            _loc3_ = var_33.readMultiByte(var_33.bytesAvailable,param2);
         }
         var_33.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_642 === const_502 && !var_1430)
         {
            if(var_971)
            {
               param1.readBytes(var_33,0,var_171);
            }
            else
            {
               if(!var_465)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_33.writeByte(120);
               _loc2_ = uint(~var_1900 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_33.writeByte(_loc2_);
               param1.readBytes(var_33,2,var_171);
               var_33.position = var_33.length;
               var_33.writeUnsignedInt(var_797);
            }
            var_170 = true;
         }
         else
         {
            if(var_642 != const_1278)
            {
               throw new Error("Compression method " + var_642 + " is not supported.");
            }
            param1.readBytes(var_33,0,var_171);
            var_170 = false;
         }
         var_33.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_972 + var_1179 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_33.length = 0;
         var_33.position = 0;
         var_170 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_33.writeUTFBytes(param1);
            }
            else
            {
               var_33.writeMultiByte(param1,param2);
            }
            var_641 = ChecksumUtil.CRC32(var_33);
            var_465 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_640 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1180 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1180 << 8 | 20);
         param1.writeShort(var_336 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_502);
         var _loc5_:Date = var_640 != null ? var_640 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_641);
         param1.writeUnsignedInt(var_171);
         param1.writeUnsignedInt(var_544);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_336 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_387);
         }
         else
         {
            _loc8_.writeMultiByte(var_387,var_336);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_465)
            {
               _loc16_ = var_170;
               if(_loc16_)
               {
                  uncompress();
               }
               var_797 = ChecksumUtil.Adler32(var_33,0,var_33.length);
               var_465 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_797);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_336 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1899);
            }
            else
            {
               _loc8_.writeMultiByte(var_1899,var_336);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_171 > 0)
         {
            if(var_971)
            {
               _loc13_ = 0;
               param1.writeBytes(var_33,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_33,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_171;
      }
      
      protected function compress() : void
      {
         if(!var_170)
         {
            if(false)
            {
               var_33.position = 0;
               var_544 = var_33.length;
               if(var_971)
               {
                  var_33.compress.apply(var_33,["deflate"]);
                  var_171 = var_33.length;
               }
               else
               {
                  var_33.compress();
                  var_171 = -6;
               }
               var_33.position = 0;
               var_170 = true;
            }
            else
            {
               var_171 = 0;
               var_544 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_972 + var_1179)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_336 == "utf-8")
         {
            var_387 = param1.readUTFBytes(var_972);
         }
         else
         {
            var_387 = param1.readMultiByte(var_972,var_336);
         }
         var _loc2_:uint = var_1179;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_387 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_797 = param1.readUnsignedInt();
               var_465 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1180 = _loc2_ >> 8;
         var_1429 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_642 = param1.readUnsignedShort();
         var_1430 = (_loc3_ & 1) !== 0;
         var_1431 = (_loc3_ & 8) !== 0;
         var_1901 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_336 = "utf-8";
         }
         if(var_642 === const_1112)
         {
            var_2185 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2186 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_642 === const_502)
         {
            var_1900 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_640 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_641 = param1.readUnsignedInt();
         var_171 = param1.readUnsignedInt();
         var_544 = param1.readUnsignedInt();
         var_972 = param1.readUnsignedShort();
         var_1179 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_33,0,param1.length);
            var_641 = ChecksumUtil.CRC32(var_33);
            var_465 = false;
         }
         else
         {
            var_33.length = 0;
            var_33.position = 0;
            var_170 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_387 + "\n  date:" + var_640 + "\n  sizeCompressed:" + var_171 + "\n  sizeUncompressed:" + var_544 + "\n  versionHost:" + var_1180 + "\n  versionNumber:" + var_1429 + "\n  compressionMethod:" + var_642 + "\n  encrypted:" + var_1430 + "\n  hasDataDescriptor:" + var_1431 + "\n  hasCompressedPatchedData:" + var_1901 + "\n  filenameEncoding:" + var_336 + "\n  crc32:" + var_641.toString(16) + "\n  adler32:" + var_797.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_170)
         {
            uncompress();
         }
         return var_33;
      }
   }
}
