*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_POVR_1_F4VALUEI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  F4VALUEREQUEST  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f4valuerequest INPUT.

TYPES: BEGIN OF ty_value,
        ordernumber TYPE vbeln,
       END OF ty_value.

DATA: lt_value TYPE STANDARD TABLE OF ty_value.

SELECT vbeln FROM vbak INTO TABLE @lt_value.

CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
  EXPORTING
*   DDIC_STRUCTURE         = ' '
    retfield               = 'ordernumber'
*   PVALKEY                = ' '
    DYNPPROG               = sy-repid
    DYNPNR                 = sy-dynnr
    DYNPROFIELD            = 'lv_onumber'
*   STEPL                  = 0
*   WINDOW_TITLE           =
*   VALUE                  = ' '
    VALUE_ORG              = 'S'  "We shall use 's' for this example
*   MULTIPLE_CHOICE        = ' '
*   DISPLAY                = ' '
*   CALLBACK_PROGRAM       = ' '
*   CALLBACK_FORM          = ' '
*   CALLBACK_METHOD        =
*   MARK_TAB               =
* IMPORTING
*   USER_RESET             =
  tables
    value_tab              = lt_value
*   FIELD_TAB              =
*   RETURN_TAB             =
*   DYNPFLD_MAPPING        =
 EXCEPTIONS
    PARAMETER_ERROR        = 1
    NO_VALUES_FOUND        = 2
    OTHERS                 = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.



ENDMODULE.
