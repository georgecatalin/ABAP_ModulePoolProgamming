*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM2_STATUS_0140O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0140 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0140 OUTPUT.
 SET PF-STATUS 'STATUSBAR'.
 SET TITLEBAR 'CUSTOM SALES ORDER'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Form action_for_exit
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM action_for_exit .
 LEAVE PROGRAM.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form action_for_refresh
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM action_for_refresh .
  " do stuff for refreshing data from database table
ENDFORM.
*&---------------------------------------------------------------------*
*& Form action_for_save
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM action_for_save .
   " do stuff to save screen table data to database table
ENDFORM.
*&---------------------------------------------------------------------*
*&      Module  F4_SUGGEST_CURRENCY  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4_suggest_currency INPUT.

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
      dynprofield     = 'ZGC_1_OH-CURRENCY'
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
*&---------------------------------------------------------------------*
*&      Module  F4_SUGGEST_CODE  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4_suggest_code INPUT.

  TYPES: BEGIN OF ty_article_values,
           article_code TYPE matnr,
           description  TYPE maktx,
        END OF ty_article_values.

  DATA: lt_article_values TYPE TABLE OF ty_article_values.

  SELECT
       matnr,
       maktx
  FROM  makt INTO TABLE @lt_article_values
    WHERE spras = 'E'.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
*     DDIC_STRUCTURE  = ' '
      retfield        = 'article_code'
*     PVALKEY         = ' '
      dynpprog        = sy-repid
      dynpnr          = sy-dynnr
      dynprofield     = 'LS_ITEM-ARTICLECODE'
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
      value_tab       = lt_article_values
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
*&---------------------------------------------------------------------*
*&      Module  F4_SUGGEST_CURRENCY_TABLE_CELL  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4_suggest_currency_table_cell INPUT.

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
