*&---------------------------------------------------------------------*
*& Module Pool      Z_MODULEPOOL_DROPDOWNLIST_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM z_modulepool_dropdownlist_1.

TABLES: zgcstate_region.

TYPES: BEGIN OF ty_data,
         region TYPE zgcderegion,
       END OF ty_data.

DATA: lt_region TYPE STANDARD TABLE OF ty_data,
      ls_region TYPE ty_data.

INCLUDE z_modulepool_dropdownlist_1i01.

INCLUDE z_modulepool_dropdownlist_1o01.
