package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_547;
         param1["bitmap"] = const_557;
         param1["border"] = const_511;
         param1["border_notify"] = const_1248;
         param1["button"] = const_452;
         param1["button_thick"] = const_655;
         param1["button_icon"] = const_1138;
         param1["button_group_left"] = const_613;
         param1["button_group_center"] = const_689;
         param1["button_group_right"] = const_634;
         param1["canvas"] = const_627;
         param1["checkbox"] = const_665;
         param1["closebutton"] = const_810;
         param1["container"] = const_321;
         param1["container_button"] = const_503;
         param1["display_object_wrapper"] = const_618;
         param1["dropmenu"] = const_372;
         param1["dropmenu_item"] = const_344;
         param1["frame"] = const_322;
         param1["frame_notify"] = const_1189;
         param1["header"] = const_692;
         param1["icon"] = const_978;
         param1["itemgrid"] = const_917;
         param1["itemgrid_horizontal"] = const_341;
         param1["itemgrid_vertical"] = const_566;
         param1["itemlist"] = const_770;
         param1["itemlist_horizontal"] = const_318;
         param1["itemlist_vertical"] = const_303;
         param1["maximizebox"] = const_1097;
         param1["menu"] = const_1326;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_845;
         param1["minimizebox"] = const_1193;
         param1["notify"] = const_1283;
         param1["ModAlertMessageComposer"] = const_346;
         param1["password"] = const_596;
         param1["radiobutton"] = const_681;
         param1["region"] = const_441;
         param1["restorebox"] = const_1111;
         param1["scaler"] = const_966;
         param1["scaler_horizontal"] = const_1255;
         param1["scaler_vertical"] = const_1098;
         param1["scrollbar_horizontal"] = const_464;
         param1["scrollbar_vertical"] = const_718;
         param1["scrollbar_slider_button_up"] = const_799;
         param1["scrollbar_slider_button_down"] = const_772;
         param1["scrollbar_slider_button_left"] = const_812;
         param1["scrollbar_slider_button_right"] = const_804;
         param1["scrollbar_slider_bar_horizontal"] = const_910;
         param1["scrollbar_slider_bar_vertical"] = const_862;
         param1["scrollbar_slider_track_horizontal"] = const_847;
         param1["scrollbar_slider_track_vertical"] = const_842;
         param1["scrollable_itemlist"] = const_1115;
         param1["scrollable_itemlist_vertical"] = const_351;
         param1["scrollable_itemlist_horizontal"] = const_931;
         param1["selector"] = const_707;
         param1["selector_list"] = const_498;
         param1["submenu"] = const_845;
         param1["tab_button"] = const_549;
         param1["tab_container_button"] = const_881;
         param1["tab_context"] = const_381;
         param1["tab_content"] = const_811;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_636;
         param1["input"] = const_649;
         param1["toolbar"] = const_1109;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
