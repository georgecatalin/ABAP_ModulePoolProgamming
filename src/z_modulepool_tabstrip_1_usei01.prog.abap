*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_TABSTRIP_1_USEI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0108  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0108 INPUT.
  SELECT vbeln, erdat, ernam, netwr, waerk FROM vbak INTO TABLE @lt_header_details
    WHERE vbeln = @vbak-vbeln.

  IF lt_header_details IS NOT INITIAL.

    " read data from internal table to structure (work area)
    READ TABLE lt_header_details INTO ls_header_details INDEX 1.

    " populate graphical user interface with data from the work area
    vbak-vbeln = ls_header_details-vbeln.
    vbak-erdat = ls_header_details-erdat.
    vbak-ernam = ls_header_details-ernam.
    vbak-netwr = ls_header_details-netwr.
    vbak-waerk = ls_header_details-waerk.

    " get data into lt_item_details
    SELECT  vbeln, posnr, matnr, werks, lgort, kwmeng FROM VBAP INTO TABLE @lt_item_details FOR ALL ENTRIES IN @lt_header_details WHERE vbeln = @vbak-vbeln.



  ENDIF.

ENDMODULE.
