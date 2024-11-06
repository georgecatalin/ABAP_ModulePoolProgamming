*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_POHR_1_F1HELPI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  F1HELP  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE f1help INPUT.

  CALL FUNCTION 'HELP_OBJECT_SHOW'
    EXPORTING
      dokclass                            = 'TX'
*     DOKLANGU                            = SY-LANGU
      dokname                             = 'TX_OCS_MERGE_BDOC' " this is a random name of document created with SE61
*     DOKTITLE                            = ' '
*     CALLED_BY_PROGRAM                   = ' '
*     CALLED_BY_DYNP                      = ' '
*     CALLED_FOR_TAB                      = ' '
*     CALLED_FOR_FIELD                    = ' '
*     CALLED_FOR_TAB_FLD_BTCH_INPUT       = ' '
*     MSG_VAR_1                           = ' '
*     MSG_VAR_2                           = ' '
*     MSG_VAR_3                           = ' '
*     MSG_VAR_4                           = ' '
*     CALLED_BY_CUAPROG                   = ' '
*     CALLED_BY_CUASTAT                   =
*     SHORT_TEXT                          = ' '
*     CLASSIC_SAPSCRIPT                   = ' '
*     MES_PROGRAM_NAME                    = ' '
*     MES_INCLUDE_NAME                    = ' '
*     MES_LINE_NUMBER                     =
*     MES_EXCEPTION                       = ' '
*   TABLES
*     LINKS                               =
   EXCEPTIONS
     OBJECT_NOT_FOUND                    = 1
     SAPSCRIPT_ERROR                     = 2
     OTHERS                              = 3
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.



ENDMODULE.
