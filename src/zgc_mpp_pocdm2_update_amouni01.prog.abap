*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM2_UPDATE_AMOUNI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  UPDATE_AMOUNT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE calculate_value_alllines INPUT.
    PERFORM calculate_sum.
ENDMODULE.


*&---------------------------------------------------------------------*
*&      Module  UPDATE_AMOUNT  INPUT
*&---------------------------------------------------------------------*
MODULE recalculate_value_alllines INPUT.
    PERFORM calculate_sum.
ENDMODULE.

MODULE apply_discounts_to_unitprices INPUT.

" Enter the discount conditions here

IF lv_old_sum >= 0.
  " do nothing
ELSE.
 IF lv_sum > 500 AND lv_sum < 1000.
    LOOP AT lt_item ASSIGNING FIELD-SYMBOL(<fs_item_1>).
      lv_old_price = <fs_item_1>-netunitprice.
      <fs_item_1>-netunitprice = lv_old_price * '0.75'.
    ENDLOOP.
  ELSEIF lv_sum > 1000.
      LOOP AT lt_item ASSIGNING FIELD-SYMBOL(<fs_item_2>).
        lv_old_price = <fs_item_2>-netunitprice.
        <fs_item_2>-netunitprice = lv_old_price * '0.5'.
      ENDLOOP.
    ENDIF.
ENDIF.

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
  lv_old_sum = lv_sum.
  CLEAR lv_sum.
  LOOP AT lt_item INTO ls_item.
    lv_sum = lv_sum + ls_item-netunitprice * ls_item-quantity.
  ENDLOOP.
ENDFORM.
