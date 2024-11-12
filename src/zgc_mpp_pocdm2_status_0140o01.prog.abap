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

  PERFORM set_ordernumber_only_output.

  REFRESH CONTROL 'tbl_items' FROM SCREEN 140.

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
  LOOP AT lt_item INTO ls_item.
    MOVE-CORRESPONDING ls_item TO ls_item_save.
    APPEND ls_item_save TO lt_item_save.
  ENDLOOP.

  MODIFY ZGC_1_OI FROM TABLE lt_item_save.

  IF sy-subrc = 0.
    MESSAGE 'Data successfully saved to database' TYPE 'W'.
  ENDIF.

  REFRESH lt_item.
  LOOP AT lt_item_save INTO ls_item_save.
    MOVE-CORRESPONDING ls_item_save TO ls_item.
    APPEND ls_item TO lt_item.
  ENDLOOP.

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
*&---------------------------------------------------------------------*
*&      Module  VALIDATE_QUANTITY  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM validate_quantity.
  " do validation logic here
  IF ls_item-quantity > 100.
    MESSAGE 'Quantity too big...' TYPE 'W'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Module  VALIDATE_CURRENCY  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM validate_currency.
  " do validation logic for currency here
  IF ls_item-currency <> 'RON'.
    MESSAGE 'We would rather prefer you to purchase in RON, right?' TYPE 'I'.
  ENDIF.

ENDFORM.



FORM set_ordernumber_only_output.
  " Add logic to protect the content of the cells in the field ordernumber from user input (make them output only)
  LOOP AT SCREEN.
    IF screen-name = 'LS_ITEM-ORDERNUMBER'.
      screen-input = 1.
      screen-color = 3.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Module  UPDATE_ORDER_NUMBER_IN_TABLE  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE update_order_number_in_table INPUT.
  " -----  write code to fulfill the functionality -----
  DATA: lv_tabix TYPE sy-tabix.

  DATA: lt_dynpfields TYPE TABLE OF dynpread,
        ls_dynpfields TYPE dynpread.

  " get the current cursor position in the table control
  GET CURSOR LINE lv_tabix.

  " update the order number in the current row of the table control
  READ TABLE lt_item INTO ls_item INDEX lv_tabix.

  IF sy-subrc = 0.
    ls_item-ordernumber = zgc_1_oh-ordernumber.
    MODIFY lt_item FROM ls_item INDEX lv_tabix.
  ENDIF.

  CLEAR: ls_dynpfields, lt_dynpfields.

  ls_dynpfields-fieldname = 'LS_ITEM-ORDERNUMBER(' && lv_tabix && ')'.
  ls_dynpfields-fieldvalue = zgc_1_oh-ordernumber.
  APPEND ls_dynpfields TO lt_dynpfields.

  CALL FUNCTION 'DYNP_VALUES_UPDATE'
    EXPORTING
      dyname               = sy-cprog
      dynumb               = sy-dynnr
    TABLES
      dynpfields           = lt_dynpfields
    EXCEPTIONS
      invalid_abapworkarea = 1
      invalid_dynprofield  = 2
      invalid_dynproname   = 3
      invalid_dynpronummer = 4
      invalid_request      = 5
      no_fielddescription  = 6
      undefind_error       = 7
      OTHERS               = 8.


ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  TBL_ITEMS_FIELDS_VALIDATION  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE tbl_items_fields_validation INPUT.
  IF sy-ucomm = 'VALIDATE'.
    IF ls_item-ordernumber IS NOT INITIAL.

      IF ls_item-orderposition IS INITIAL.
        MESSAGE 'Enter the order line number' TYPE 'W'.
      ENDIF.

      IF ls_item-description IS INITIAL.
        MESSAGE 'Enter the description' TYPE 'W'.
      ENDIF.

    ENDIF.

    PERFORM validate_currency.
    PERFORM validate_quantity.


  ENDIF.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  VALIDATE_ORDER_LINE  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE validate_order_line INPUT.
  IF ls_item-orderposition IS INITIAL.
        MESSAGE 'Enter the order line number after enter' TYPE 'W'.
      ENDIF.
ENDMODULE.
