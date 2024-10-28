*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_SUBSCREENS_1_UI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

   SELECT vbeln, erdat, erzet, ernam, augru, netwr, waerk, vkorg, vtweg, spart, vkgrp
   FROM vbak
   INTO TABLE @lt_data
     WHERE vbeln = @vbak-vbeln.

READ TABLE lt_data INTO ls_data INDEX 1.

IF sy-subrc = 0.
  vbak-vbeln = ls_data-vbeln.
  vbak-erdat = ls_data-erdat.
  vbak-erzet = ls_data-erzet.
  vbak-ernam = ls_data-ernam.
  vbak-augru = ls_data-augru.
  vbak-netwr = ls_data-netwr.
  vbak-waerk = ls_data-waerk.
  vbak-vkorg = ls_data-vkorg.
  vbak-vtweg = ls_data-vtweg.
  vbak-spart = ls_data-spart.
  vbak-vkgrp = ls_data-vkgrp.
ENDIF.

ENDMODULE.
