package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["ModAlertMessageComposer"] = const_89;
         param1["bound_to_parent_rect"] = const_85;
         param1["child_window"] = const_904;
         param1["embedded_controller"] = const_320;
         param1["resize_to_accommodate_children"] = const_61;
         param1["input_event_processor"] = const_47;
         param1["internal_event_handling"] = const_699;
         param1["mouse_dragging_target"] = const_209;
         param1["mouse_dragging_trigger"] = const_310;
         param1["mouse_scaling_target"] = const_221;
         param1["mouse_scaling_trigger"] = const_435;
         param1["horizontal_mouse_scaling_trigger"] = const_186;
         param1["vertical_mouse_scaling_trigger"] = const_213;
         param1["observe_parent_input_events"] = const_913;
         param1["optimize_region_to_layout_size"] = const_448;
         param1["parent_window"] = const_915;
         param1["relative_horizontal_scale_center"] = const_160;
         param1["relative_horizontal_scale_fixed"] = const_123;
         param1["relative_horizontal_scale_move"] = const_275;
         param1["relative_horizontal_scale_strech"] = const_235;
         param1["relative_scale_center"] = const_777;
         param1["relative_scale_fixed"] = const_612;
         param1["relative_scale_move"] = const_960;
         param1["relative_scale_strech"] = const_968;
         param1["relative_vertical_scale_center"] = const_152;
         param1["relative_vertical_scale_fixed"] = const_119;
         param1["relative_vertical_scale_move"] = const_317;
         param1["relative_vertical_scale_strech"] = const_262;
         param1["on_resize_align_left"] = const_617;
         param1["on_resize_align_right"] = const_429;
         param1["on_resize_align_center"] = const_410;
         param1["on_resize_align_top"] = const_577;
         param1["on_resize_align_bottom"] = const_359;
         param1["on_resize_align_middle"] = const_466;
         param1["on_accommodate_align_left"] = const_905;
         param1["on_accommodate_align_right"] = const_442;
         param1["on_accommodate_align_center"] = const_531;
         param1["on_accommodate_align_top"] = const_832;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_504;
         param1["route_input_events_to_parent"] = const_461;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_883;
         param1["scalable_with_mouse"] = const_859;
         param1["reflect_horizontal_resize_to_parent"] = const_399;
         param1["reflect_vertical_resize_to_parent"] = const_398;
         param1["reflect_resize_to_parent"] = const_246;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
