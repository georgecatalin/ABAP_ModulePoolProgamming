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

* -------------------
* move back the data to the internal table which is used for displaying in the table control
* -----------------------
    REFRESH lt_item.
    " The REFRESH statement clears all entries from the internal table.
    " It resets the table to its initial, empty state.

    LOOP AT lt_item_save INTO ls_item_save.
      MOVE-CORRESPONDING ls_item_save to ls_item.
      APPEND ls_item TO lt_item.
    ENDLOOP.


  ENDIF.
ENDMODULE.
