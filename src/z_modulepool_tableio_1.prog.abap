*&---------------------------------------------------------------------*
*& Module Pool      Z_MODULEPOOL_TABLEIO_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z_MODULEPOOL_TABLEIO_1.


TYPES: BEGIN OF ty_mara,
        matnr TYPE mara-matnr, " Material Number
        mtart TYPE mara-mtart,  " Material Type  (e.g., raw materials, finished goods)
        mbrsh TYPE mara-mbrsh,  " Industry sector (e.g., chemicals, pharmaceuticals).
        meins TYPE mara-meins, " Base Unit of Measure. The base unit of measure defines the unit in which the material is managed in stock, such as "KG" for kilograms, "EA" for each, or "M" for meters.
       END OF ty_mara.

DATA: lt_mara TYPE TABLE OF ty_mara,
      ls_mara TYPE ty_mara.

INCLUDE z_modulepool_tableio_1_useri01.

INCLUDE z_modulepool_tableio_1_valii01.

INCLUDE z_modulepool_tableio_1_valii02.
