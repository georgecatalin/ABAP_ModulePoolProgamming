*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_TABSTRIP_GETI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  GET_DATA_FROM_DB  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE get_data_from_db INPUT.

  SELECT SINGLE *  FROM mara INTO CORRESPONDING FIELDS OF @ls_mara
    WHERE matnr = @LS_MARA-MATNR.

  SELECT SINGLE * FROM makt INTO CORRESPONDING FIELDS OF @ls_makt
    WHERE matnr = @LS_MARA-MATNR AND spras = 'E'.

ENDMODULE.
