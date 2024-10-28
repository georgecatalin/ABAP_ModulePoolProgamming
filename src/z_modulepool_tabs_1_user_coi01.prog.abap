*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_TABS_1_USER_COI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0120  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0120 INPUT.

  SELECT vbeln, erdat, ernam, netwr, waerk FROM vbak INTO TABLE @lt_header_details
    WHERE vbeln = @vbak-vbeln.


  IF lt_header_details IS NOT INITIAL.

    SELECT vbeln, posnr, matnr, werks, lgort, kwmeng FROM vbap INTO TABLE @lt_item_details
      FOR ALL ENTRIES IN @lt_header_details
      WHERE vbeln = @lt_header_details-vbeln.

       READ TABLE lt_header_details INTO ls_header_details INDEX 1.

        vbak-vbeln = ls_header_details-vbeln.
        vbak-erdat = ls_header_details-erdat.
        vbak-ernam = ls_header_details-ernam.
        vbak-netwr = ls_header_details-netwr.
        vbak-waerk = ls_header_details-waerk.




  ENDIF.

ENDMODULE.
