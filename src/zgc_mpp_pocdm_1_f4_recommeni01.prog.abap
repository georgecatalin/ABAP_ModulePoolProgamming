*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM_1_F4_RECOMMENI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  F4_RECOMMEND_CURRENCIES  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4_recommend_currencies INPUT.

  TYPES: BEGIN OF ty_currency_values,
           currency TYPE waers,
           isocd    TYPE isocd,
           short    TYPE ktext,
           long     TYPE ltext,
        END OF ty_currency_values.

  DATA: lt_currency_values TYPE TABLE OF ty_currency_values.

  SELECT DISTINCT
      tcurc~waers AS currency,
      tcurc~isocd AS iso_currency,
      tcurt~ktext AS short_text,
      tcurt~ltext AS long_text
  FROM  tcurc INNER JOIN tcurt ON tcurc~waers = tcurt~waers INTO TABLE @lt_currency_values
    WHERE spras = 'E'.


  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
*     DDIC_STRUCTURE  = ' '
      retfield        = 'currency'
*     PVALKEY         = ' '
      dynpprog        = sy-repid
      dynpnr          = sy-dynnr
      dynprofield     = 'LS_ITEM-CURRENCY'
*     STEPL           = 0
*     WINDOW_TITLE    =
*     VALUE           = ' '
      value_org       = 'S'  "We shall use 's' for this example
*     MULTIPLE_CHOICE = ' '
*     DISPLAY         = ' '
*     CALLBACK_PROGRAM       = ' '
*     CALLBACK_FORM   = ' '
*     CALLBACK_METHOD =
*     MARK_TAB        =
* IMPORTING
*     USER_RESET      =
    TABLES
      value_tab       = lt_currency_values
*     FIELD_TAB       =
*     RETURN_TAB      =
*     DYNPFLD_MAPPING =
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDMODULE.
