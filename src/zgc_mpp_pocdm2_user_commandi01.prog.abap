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
    WHEN 'CS'.
      PERFORM get_material_description.
    WHEN OTHERS.
      PERFORM action_for_save.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  GET_MATERIAL_DESCRIPTION  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
FORM get_material_description.
  CASE sy-curow.
    WHEN 12.
      IF ls_item-articlecode IS NOT INITIAL.
        SELECT SINGLE maktx FROM makt INTO @ls_item-description
          WHERE matnr = @ls_item-articlecode AND
                spras = 'e'.

        IF sy-subrc = 0.
          MESSAGE 'Material description retrieved succcessfully' TYPE 'S'.
        ELSE.
          MESSAGE 'Incorrect material code' TYPE 'E'.
        ENDIF.
      ENDIF.
  ENDCASE.
ENDFORM.
