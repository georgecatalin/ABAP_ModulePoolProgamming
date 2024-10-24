*&---------------------------------------------------------------------*
*& Module Pool      Z_MODULEPOOL_MODALDIALOGBOX_1
*&---------------------------------------------------------------------*
*& Author: George Calin
*& Email: george.calin@gmail.com
*& Date: 2024-10-24
*&---------------------------------------------------------------------*
PROGRAM z_modulepool_modaldialogbox_1.

TABLES: vbak.

TYPES: BEGIN OF ty_data,
         vbeln TYPE vbak-vbeln,
         erdat TYPE vbak-erdat,
         ernam TYPE vbak-ernam,
         netwr TYPE vbak-netwr,
         waerk TYPE vbak-waerk,
       END OF ty_data.

DATA: lt_data TYPE STANDARD TABLE OF ty_data,
      ls_data TYPE ty_data.

INCLUDE z_modulepool_modaldialogboxi01.

INCLUDE z_modulepool_modaldialogboxi02.
