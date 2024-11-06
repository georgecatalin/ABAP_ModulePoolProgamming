*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_MULTIPLESUBS_1I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0127  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0127 INPUT.

  IF sy-ucomm = 'HEADER'.
    lv_screen = '0128'.
  ELSEIF sy-ucomm = 'ITEM'.
    lv_screen = '0129'.
  ENDIF.


  SELECT vbeln, erdat, ernam, angdt, bnddt, netwr, waerk FROM vbak INTO TABLE @lt_header
    WHERE vbeln = @lv_onumber.

  IF lt_header IS NOT INITIAL.

    READ TABLE lt_header INTO ls_header INDEX 1.

    IF sy-subrc = 0.

      lv_vbeln = ls_header-t_vbeln.
      lv_erdat = ls_header-t_erdat.
      lv_ernam = ls_header-t_ernam.
      lv_angdt = ls_header-t_angdt.
      lv_bnddt = ls_header-t_bnddt.
      lv_netwr = ls_header-t_netwr.
      lv_waerk = ls_header-t_waerk.

    ENDIF.


     SELECT vbeln, posnr, matnr, matkl FROM vbap INTO TABLE @lt_item FOR ALL ENTRIES IN @lt_header
       WHERE vbeln = @lt_header-t_vbeln.

  ENDIF.

ENDMODULE.
