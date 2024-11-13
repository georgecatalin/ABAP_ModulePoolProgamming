*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_TABLECONTROLI02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  GET_MODIFIED_RECORDS  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE get_modified_records INPUT.
   lv_current_line = mytable-CURRENT_LINE.
   MODIFY lt_item FROM ls_item INDEX mytable-CURRENT_LINE.
ENDMODULE.
