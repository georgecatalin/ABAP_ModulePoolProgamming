*&---------------------------------------------------------------------*
*& Module Pool      ZGC_MODULEPOOL_TABLECONTROL_W
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM ZGC_MODULEPOOL_TABLECONTROL_W.



CONTROLS: mytable TYPE TABLEVIEW USING SCREEN '0100'.

TYPES: BEGIN OF ty_item,
         ordernumber      TYPE zdeonumber,
         orderposition    TYPE zdeoposn,
         articlecode      TYPE zdematnr,
         description      TYPE zdematdesc,
         quantity         TYPE zdeqty_g,
         unitofmeasure    TYPE zdeunitm,
         netunitprice     TYPE zdenup,
         currency         TYPE zdecurrency,
       END OF ty_item.

DATA: lt_item TYPE TABLE OF ty_item,
      ls_item TYPE ty_item.

DATA: lt_item_save TYPE TABLE OF ZGC_1_OI,
      ls_item_save TYPE ZGC_1_OI.

INCLUDE zgc_modulepool_tablecontroli02.

INCLUDE zgc_modulepool_tablecontroli03.
