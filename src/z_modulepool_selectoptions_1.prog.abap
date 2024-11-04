*&---------------------------------------------------------------------*
*& Module Pool      Z_MODULEPOOL_SELECTOPTIONS_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z_MODULEPOOL_SELECTOPTIONS_1.

DATA: lv_matnr TYPE mara-matnr.

SELECTION-SCREEN: BEGIN OF SCREEN 126 AS SUBSCREEN.
  SELECT-OPTIONS : s_matnr FOR lv_matnr.
SELECTION-SCREEN: END OF SCREEN 126.
