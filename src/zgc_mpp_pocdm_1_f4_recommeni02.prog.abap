*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM_1_F4_RECOMMENI02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  F4_RECOMMEND_ARTICLES  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4_recommend_articles INPUT.

 TYPES: BEGIN OF ty_article_values,
           article_code TYPE matnr,
           description  TYPE maktx,
        END OF ty_article_values.

  DATA: lt_article_values TYPE TABLE OF ty_article_values.

  SELECT
       matnr,
       maktx
  FROM  makt INTO TABLE @lt_article_values.

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
