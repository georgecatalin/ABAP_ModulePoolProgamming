*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_SELECTROW_1_USI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0130  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0130 INPUT.



  IF sy-ucomm = 'SUBMIT'.

    CLEAR: lt_cumulative.

    SELECT vbeln, erdat, ernam, netwr, waerk FROM vbak INTO TABLE @lt_header
        WHERE vbeln = @lv_ono.

    IF lt_header IS NOT INITIAL.

      SELECT vbeln, posnr, matnr, matkl FROM vbap INTO TABLE @lt_item FOR ALL ENTRIES IN @lt_header
        WHERE vbeln = @lt_header-vbeln.

    ENDIF.

    READ TABLE lt_header INTO ls_header INDEX 1.

    LOOP AT lt_item INTO ls_item WHERE vbeln = ls_header-vbeln.

      ls_cumulative-vbeln = ls_header-vbeln.
      ls_cumulative-erdat = ls_header-erdat.
      ls_cumulative-ernam = ls_header-ernam.
      ls_cumulative-netwr = ls_header-netwr.
      ls_cumulative-waerk = ls_header-waerk.
      ls_cumulative-posnr = ls_item-posnr.
      ls_cumulative-matnr = ls_item-matnr.
      ls_cumulative-matkl = ls_item-matkl.

      APPEND ls_cumulative TO lt_cumulative.
      CLEAR: ls_cumulative.

    ENDLOOP.


    " copy from the database table all the records that exist in the internal table that feeds the table to the new table where we will compare matching upon the two keys 'vbeln' and 'posnr'
    IF lt_cumulative IS NOT INITIAL.
         SELECT vbeln, posnr FROM ZGCPAYMENT INTO TABLE @lt_compare
         FOR ALL ENTRIES IN @lt_cumulative WHERE vbeln = @lt_cumulative-vbeln AND posnr = @lt_cumulative-posnr.
    ENDIF.



    LOOP AT lt_cumulative INTO ls_cumulative.
      lv_index = sy-tabix.

       READ TABLE lt_compare INTO ls_compare WITH KEY vbeln = ls_cumulative-vbeln posnr = ls_cumulative-posnr.

       IF sy-subrc = 0.
         DELETE lt_cumulative INDEX lv_index.
       ENDIF.

    ENDLOOP.

   ELSEIF sy-ucomm = 'MOVE'.

     CLEAR lt_destination.

   LOOP AT lt_cumulative INTO ls_cumulative.
     IF ls_cumulative-select_helper = 'X'. " this is the selected column
       ls_destination-vbeln = ls_cumulative-vbeln.
       ls_destination-posnr = ls_cumulative-posnr.
       ls_destination-matnr = ls_cumulative-matnr.

       APPEND ls_destination TO lt_destination.
       CLEAR ls_destination.

    ENDIF.
   ENDLOOP.

  IF lt_destination IS NOT INITIAL.
    INSERT ZGCPAYMENT FROM TABLE lt_destination.
    DELETE lt_cumulative WHERE select_helper = 'X'.
  ENDIF.

  ENDIF.

ENDMODULE.
