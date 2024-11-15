FUNCTION Z_GET_ITEM_DESC.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_ITEMCODE) TYPE  MATNR
*"  EXPORTING
*"     REFERENCE(EV_ITEMDESC) TYPE  MAKTX
*"----------------------------------------------------------------------

SELECT SINGLE maktx FROM makt INTO @EV_ITEMDESC
          WHERE matnr = @IV_ITEMCODE AND
                spras = 'E'.

IF sy-subrc = 0.
   MESSAGE 'Material description retrieved succcessfully' TYPE 'S'.
ELSE.
  EV_ITEMDESC = 'abcd'. " Returns blank string in case nothing is retrieved
   MESSAGE 'Incorrect material code' TYPE 'E'.
ENDIF.

ENDFUNCTION.
