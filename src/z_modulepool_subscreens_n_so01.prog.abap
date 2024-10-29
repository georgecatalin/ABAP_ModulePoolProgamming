*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_SUBSCREENS_1_SO01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.



ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATION_MODULE  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validation_module INPUT.

 SELECT vbeln, erdat, erzet, ernam, augru, netwr, waerk, vkorg, vtweg, spart, vkgrp FROM vbak INTO TABLE @lt_data WHERE vbeln = @vbak-vbeln.

 IF sy-subrc <> 0. " Some error occurred when executing the SELECT statement

   MESSAGE E000(ZMSG_GEORGE).

 ENDIF.

ENDMODULE.
