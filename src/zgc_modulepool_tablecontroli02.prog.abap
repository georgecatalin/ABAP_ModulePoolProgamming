*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_TABLECONTROLI02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  GET_MODIFIED_RECORDS  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE get_modified_records INPUT.
  MOVE-CORRESPONDING ls_item TO ls_item_save.
  APPEND ls_item_save TO lt_item_save.
ENDMODULE.
