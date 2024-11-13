*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM2_UPDATE_AMOUNI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  UPDATE_AMOUNT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE update_amount INPUT.
    PERFORM calculate_sum.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form calculate_sum
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM calculate_sum .
  CLEAR lv_sum.
  LOOP AT lt_item INTO ls_item.
    lv_sum = lv_sum + ls_item-netunitprice.
  ENDLOOP.
ENDFORM.