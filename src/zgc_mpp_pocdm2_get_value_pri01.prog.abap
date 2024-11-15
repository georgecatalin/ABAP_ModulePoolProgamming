*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM2_GET_VALUE_PRI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  GET_VALUE_PREVIOUS_LINES  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE get_value_previous_lines INPUT.
  CLEAR lv_sum.

  LOOP AT lt_item INTO ls_item.
   lv_sum = lv_sum + ls_item-quantity * ls_item-netunitprice.
  ENDLOOP.

ENDMODULE.
