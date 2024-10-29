*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZGCSTATE_REGION.................................*
DATA:  BEGIN OF STATUS_ZGCSTATE_REGION               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZGCSTATE_REGION               .
CONTROLS: TCTRL_ZGCSTATE_REGION
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZGCSTATE_REGION               .
TABLES: ZGCSTATE_REGION                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
