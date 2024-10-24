*&---------------------------------------------------------------------*
*& Modulpool Z_MODULEPOOL_SUBSCREENS_1
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Email: george.calin@gmail.com
*& Date: 2024-10-24
*&
*&---------------------------------------------------------------------*
PROGRAM Z_MODULEPOOL_SUBSCREENS_1.

TABLES: vbak.

TYPES: BEGIN OF ty_data,
        vbeln TYPE vbak-vbeln,
        erdat TYPE vbak-erdat,
        erzet TYPE vbak-erzet,
        ernam TYPE vbak-ernam,
        augru TYPE vbak-augru,
        netwr TYPE vbak-netwr,
        waerk TYPE vbak-waerk,
        vkorg TYPE vbak-vkorg,
        vtweg TYPE vbak-vtweg,
        spart TYPE vbak-spart,
        vkgrp TYPE vbak-vkgrp,
      END OF ty_data.

DATA: lt_data TYPE TABLE OF ty_data,
      ls_data TYPE ty_data.


INCLUDE z_modulepool_subscreens_1_so01.

INCLUDE z_modulepool_subscreens_1_ui01.
