*&---------------------------------------------------------------------*
*& Module Pool      ZGC_MODULEPOOL_TABLECONTROL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM ZGC_MODULEPOOL_TABLECONTROL.

CONTROLS: mytable TYPE TABLEVIEW USING SCREEN '0100'.

TYPES: BEGIN OF ty_mara,
        matnr TYPE mara-matnr,
        mtart TYPE mara-mtart,
        mbrsh TYPE mara-mbrsh,
        meins TYPE mara-meins,
      END OF ty_mara.

DATA: lt_mara TYPE STANDARD TABLE OF ty_mara,
      ls_mara TYPE ty_mara.

DATA: lv_mtart TYPE mara-mtart.

INCLUDE zgc_modulepool_tablecontroli01.
