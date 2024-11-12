*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_TABLEIO_1_VALII02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  VALIDATE_MULTIPLE_FIELDS  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validate_multiple_fields INPUT.
   IF ls_mara-mtart IS INITIAL.
     MESSAGE 'Enter the article type' TYPE 'W'.
   ENDIF.

   IF ls_mara-mbrsh IS INITIAL.
     MESSAGE 'Enter the Industry' TYPE 'W'.
   ENDIF.

ENDMODULE.
