*----------------------------------------------------------------------*
***INCLUDE ZGC_MPP_POCDM2_USER_COMMANDI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0140  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0140 INPUT.
  CASE sy-ucomm.
    WHEN 'EXIT'.
      PERFORM action_for_exit.
    WHEN 'REFRESH'.
      PERFORM action_for_refresh.
    WHEN 'SAVE'.
      PERFORM action_for_save.
  ENDCASE.
ENDMODULE.
