*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_INTEGRATE_1_USI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0123  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0123 INPUT.

  IF R1 = 'X'.
    LEAVE TO TRANSACTION 'ZMP_MODALDIALOG_1'.
  ELSEIF R2 = 'X'.
    LEAVE TO TRANSACTION 'ZDEMOSUBSCREEN1'.
  ELSEIF R3 = 'X'.
    LEAVE TO TRANSACTION 'Z_TABSTRIP_1'.
  ENDIF.

ENDMODULE.
