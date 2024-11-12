*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_TABLEIO_1_USERI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'GET'.
    SELECT SINGLE matnr, mtart, mbrsh, meins FROM mara INTO @ls_mara
      WHERE matnr = @ls_mara-matnr.
  ENDIF.

  IF sy-subrc <> 0.
    MESSAGE 'Incorrect item code' TYPE 'E'.
  ENDIF.


ENDMODULE.
