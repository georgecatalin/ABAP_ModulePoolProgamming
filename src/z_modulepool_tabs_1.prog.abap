*&---------------------------------------------------------------------*
*& Module Pool      Z_MODULEPOOL_TABS_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM Z_MODULEPOOL_TABS_1.

TABLES: vbak, vbap.

TYPES: BEGIN OF ty_header_details,
         vbeln TYPE vbak-vbeln,
         erdat TYPE vbak-erdat,
         ernam TYPE vbak-ernam,
         netwr TYPE vbak-netwr,
         waerk TYPE vbak-waerk,
       END OF ty_header_details.

DATA: lt_header_details TYPE TABLE OF ty_header_details,
      ls_header_details TYPE ty_header_details.

TYPES: BEGIN OF ty_item_details,
         vbeln  TYPE vbap-vbeln,
         posnr  TYPE vbap-posnr,
         matnr  TYPE vbap-matnr,
         werks  TYPE vbap-werks,
         lgort  TYPE vbap-lgort,
         kwmeng TYPE vbap-kwmeng,
       END OF ty_item_details.

DATA: lt_item_details TYPE TABLE OF ty_item_details,
      ls_item_details TYPE ty_item_details.



*&SPWIZARD: FUNCTION CODES FOR TABSTRIP 'Z_TBL_TAB'
CONSTANTS: BEGIN OF C_Z_TBL_TAB,
             TAB1 LIKE SY-UCOMM VALUE 'Z_TBL_TAB_FC1',
             TAB2 LIKE SY-UCOMM VALUE 'Z_TBL_TAB_FC2',
           END OF C_Z_TBL_TAB.
*&SPWIZARD: DATA FOR TABSTRIP 'Z_TBL_TAB'
CONTROLS:  Z_TBL_TAB TYPE TABSTRIP.
DATA:      BEGIN OF G_Z_TBL_TAB,
             SUBSCREEN   LIKE SY-DYNNR,
             PROG        LIKE SY-REPID VALUE 'Z_MODULEPOOL_TABS_1',
             PRESSED_TAB LIKE SY-UCOMM VALUE C_Z_TBL_TAB-TAB1,
           END OF G_Z_TBL_TAB.
DATA:      OK_CODE LIKE SY-UCOMM.

*&SPWIZARD: OUTPUT MODULE FOR TS 'Z_TBL_TAB'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: SETS ACTIVE TAB
MODULE Z_TBL_TAB_ACTIVE_TAB_SET OUTPUT.
  Z_TBL_TAB-ACTIVETAB = G_Z_TBL_TAB-PRESSED_TAB.
  CASE G_Z_TBL_TAB-PRESSED_TAB.
    WHEN C_Z_TBL_TAB-TAB1.
      G_Z_TBL_TAB-SUBSCREEN = '0121'.
    WHEN C_Z_TBL_TAB-TAB2.
      G_Z_TBL_TAB-SUBSCREEN = '0122'.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TS 'Z_TBL_TAB'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GETS ACTIVE TAB
MODULE Z_TBL_TAB_ACTIVE_TAB_GET INPUT.
  OK_CODE = SY-UCOMM.
  CASE OK_CODE.
    WHEN C_Z_TBL_TAB-TAB1.
      G_Z_TBL_TAB-PRESSED_TAB = C_Z_TBL_TAB-TAB1.
    WHEN C_Z_TBL_TAB-TAB2.
      G_Z_TBL_TAB-PRESSED_TAB = C_Z_TBL_TAB-TAB2.
    WHEN OTHERS.
*&SPWIZARD:      DO NOTHING
  ENDCASE.
ENDMODULE.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'Z_TBL_1' ITSELF
CONTROLS: Z_TBL_1 TYPE TABLEVIEW USING SCREEN 0122.

*&SPWIZARD: OUTPUT MODULE FOR TC 'Z_TBL_1'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE Z_TBL_1_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE LT_ITEM_DETAILS LINES Z_TBL_1-lines.
ENDMODULE.

INCLUDE z_modulepool_tabs_1_user_coi01.
