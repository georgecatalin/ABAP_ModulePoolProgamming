*&---------------------------------------------------------------------*
*& Module Pool      ZGC_MODULEPOOL_TABSTRIP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM ZGC_MODULEPOOL_TABSTRIP.

CONTROLS: TBSTRIP TYPE TABSTRIP.

TYPES: BEGIN OF ty_mara,
        matnr TYPE mara-matnr, " Material Number
        mtart TYPE mara-mtart, " Material Type
        mbrsh TYPE mara-mbrsh, " Industry Sector
        meins TYPE mara-meins, " Base Unit of Measure
       END OF ty_mara.

 DATA: lt_mara TYPE TABLE OF ty_mara,
       ls_mara TYPE ty_mara.

TYPES: BEGIN OF ty_makt,
        matnr TYPE makt-matnr, " Material Number
        maktx TYPE makt-maktx, " Material Description
        spras TYPE makt-spras, " Language Key
       END OF ty_makt.

DATA: lt_makt TYPE TABLE OF ty_makt,
      ls_makt TYPE ty_makt.

INCLUDE zgc_modulepool_tabstrip_geti01.

INCLUDE zgc_modulepool_tabstrip_usei01.

INCLUDE zgc_modulepool_tabstrip_stao01.
