*&---------------------------------------------------------------------*
*& Module Pool      ZGC_MPP_POCDM2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM ZGC_MPP_POCDM2.

* Declare variables for internal tables and work areas to be used with the UI controls

DATA: lt_header TYPE STANDARD TABLE OF ZGC_1_OH,
      ls_header TYPE ZGC_1_OH.

TYPES: BEGIN OF ty_item,
        selection_helper TYPE C, " will use this in the selection of the line in the table control
        ordernumber TYPE ZDEONUMBER,
        orderposition TYPE ZDEOPOSN,
        articlecode TYPE ZDEMATNR,
        description TYPE ZDEMATDESC,
        quantity TYPE ZDEQTY_G,
        unitofmeasure TYPE ZDEUNITM,
        netunitprice TYPE ZDENUP,
        currency TYPE ZDECURRENCY,
       END OF ty_item.

DATA: lt_item TYPE TABLE OF ty_item,
      ls_item TYPE ty_item.

INCLUDE zgc_mpp_pocdm2_status_0140o01.

INCLUDE zgc_mpp_pocdm2_user_commandi01.
