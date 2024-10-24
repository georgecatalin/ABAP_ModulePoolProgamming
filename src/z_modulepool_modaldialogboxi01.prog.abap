*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_MODALDIALOGBOXI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0103 INPUT.

  SELECT vbeln, erdat, ernam, netwr, waerk FROM vbak INTO TABLE @lt_data
    WHERE vbeln = @vbak-vbeln.

  READ TABLE lt_data INTO ls_data INDEX 1.

  IF sy-subrc = 0.
    vbak-vbeln = ls_data-vbeln.
    vbak-erdat = ls_data-erdat.
    vbak-ernam = ls_data-ernam.
    vbak-netwr = ls_data-netwr.
    vbak-waerk = ls_data-waerk.
  ENDIF.

  CALL SCREEN 0104 STARTING AT 10 20 "top left corner of the dialog box
                   ENDING AT 60 70. "bottom right corner of the dialog box
ENDMODULE.
