*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_TABLECONTROLI03.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'SAVE'.
    MODIFY ZGC_1_OI FROM TABLE lt_item_save.  " this saves to database table
  ENDIF.

  IF sy-ucomm = 'ENTR'.
    MESSAGE 'Enter key was pressed' TYPE 'I'.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  GET_SUM  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE get_sum INPUT.

  CLEAR lv_sum.

 LOOP AT lt_item INTO ls_item.
   lv_sum = lv_sum + ls_item-netunitprice.
 ENDLOOP.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  APPLY_DISCOUNTS  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE apply_discounts INPUT.

  IF lv_sum > 500.

    LOOP AT lt_item ASSIGNING FIELD-SYMBOL(<fs_record>).
      IF sy-tabix = lv_current_line.
        lv_old_price = <fs_record>-netunitprice.
        <fs_record>-netunitprice = lv_old_price * '0.25' .
        EXIT.
      ENDIF.
    ENDLOOP.

   ENDIF.

ENDMODULE.
