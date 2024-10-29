*----------------------------------------------------------------------*
***INCLUDE Z_MODULEPOOL_DROPDOWNLIST_1O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0124 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0124 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.

  DATA: lt_values TYPE vrm_values,
        ls_values TYPE vrm_value.

  IF zgcstate_region-state IS NOT INITIAL.

    CLEAR lt_values. " clear the internal table that holds the values of the drop-down list so that they do not accumulate between consecutive selections


    LOOP AT lt_region INTO ls_region.


      ls_values-key = ls_region-region.
      ls_values-text = ls_region-region.

      APPEND ls_values TO lt_values.
      CLEAR ls_values.
    ENDLOOP.


  ENDIF.

  CLEAR zgcstate_region-region. " clear the contents of the drop-down list of left-over values between selections

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = 'ZGCSTATE_REGION-REGION'
      values          = lt_values
    EXCEPTIONS
      id_illegal_name = 1
      OTHERS          = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.



ENDMODULE.
