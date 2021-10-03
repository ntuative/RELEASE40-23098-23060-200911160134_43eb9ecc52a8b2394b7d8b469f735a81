package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1065:int = 0;
       
      
      private var var_75:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_92:RoomObjectModel;
      
      private var var_356:IRoomObjectEventHandler;
      
      private var var_1319:Vector3d;
      
      private var var_1604:int = 0;
      
      private var _id:int;
      
      private var var_1318:Vector3d;
      
      private var var_216:Vector3d;
      
      private var var_421:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_75 = new Vector3d();
         var_216 = new Vector3d();
         var_1319 = new Vector3d();
         var_1318 = new Vector3d();
         var_421 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_421[_loc3_] = 0;
            _loc3_--;
         }
         var_92 = new RoomObjectModel();
         _visualization = null;
         var_356 = null;
         _updateID = 0;
         var_1604 = var_1065++;
      }
      
      public function getInstanceId() : int
      {
         return var_1604;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_75 = null;
         var_216 = null;
         if(var_92 != null)
         {
            var_92.dispose();
            var_92 = null;
         }
         var_421 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1319.assign(var_75);
         return var_1319;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_75.x != param1.x || var_75.y != param1.y || var_75.z != param1.z)
         {
            var_75.x = param1.x;
            var_75.y = param1.y;
            var_75.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_216.x != param1.x || var_216.y != param1.y || var_216.z != param1.z)
         {
            var_216.x = (param1.x % 360 + 360) % 360;
            var_216.y = (param1.y % 360 + 360) % 360;
            var_216.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_356;
      }
      
      public function getDirection() : IVector3d
      {
         var_1318.assign(var_216);
         return var_1318;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_421.length)
         {
            if(var_421[param2] != param1)
            {
               var_421[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_356)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_356;
         if(_loc2_ != null)
         {
            var_356 = null;
            _loc2_.object = null;
         }
         var_356 = param1;
         if(var_356 != null)
         {
            var_356.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_421.length)
         {
            return var_421[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_92;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_92;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
