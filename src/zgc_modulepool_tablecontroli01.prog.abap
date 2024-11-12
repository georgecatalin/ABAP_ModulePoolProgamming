*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_TABLECONTROLI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'GET'.
      SELECT matnr, mtart, mbrsh, meins FROM mara INTO CORRESPONDING FIELDS OF TABLE @lt_mara
          WHERE mtart = @lv_mtart.

      mytable-lines = sy-dbcnt.
* sy-dbcnt: is a system variable in ABAP. It stands for "database count" and typically contains the number of
*& records affected by the last database operation (like SELECT, UPDATE, etc.).
*This sets the number of rows in the table control to match the number of records retrieved from the database with SELECT

  ENDCASE.
ENDMODULE.
