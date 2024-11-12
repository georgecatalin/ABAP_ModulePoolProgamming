*----------------------------------------------------------------------*
***INCLUDE ZGC_MODULEPOOL_CB_RB_USER_CI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  IF sy-ucomm = 'DOWN'.
    IF lv_chk1 = 'X'.
      lv_text = 'Downloading the file'.
    ELSEIF lv_chk1 = ''.
      lv_text = 'Not downloading the file.'.
    ENDIF.
  ENDIF.

   IF sy-ucomm = 'PICK'.
     IF lv_rb1 = 'X'.
       lv_text1 = 'I selected North'.
     ELSEIF lv_rb2 = 'X'.
       lv_text1 = 'I chose South'.
     ENDIF.

   ENDIF.

ENDMODULE.
