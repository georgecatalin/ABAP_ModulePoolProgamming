*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_TABSTRIP_USEI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  IF sy-ucomm = 'TAB1'.
    TBSTRIP-ACTIVETAB = 'TAB1'. " Function code, not tab name
  ELSEIF sy-ucomm = 'TAB2'.
     TBSTRIP-ACTIVETAB = 'TAB2'. " Function code, not tab name
  ENDIF.

ENDMODULE.
