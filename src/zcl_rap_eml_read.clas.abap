CLASS zcl_rap_eml_read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_read IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " step 1 - READ
*    READ ENTITIES OF ZI_RAP_Travel_001
*      ENTITY travel
*        FROM VALUE #( ( TravelUUID = '7F660030AF51861C1800D2EE67CAB9FB' ) )  "00000034
*      RESULT DATA(travels).
*
*    out->write( travels ).

    " step 2 - READ with fields
*    READ ENTITIES OF ZI_RAP_Travel_001
*      ENTITY travel
*      FIELDS ( AgencyID CustomerID )
*        WITH VALUE #( ( TravelUUID = '7F660030AF51861C1800D2EE67CAB9FB' ) ) "00000034
*      RESULT DATA(travels).
*
*    out->write( travels ).

    " step 3 - READ all fields
*    READ ENTITIES OF ZI_RAP_Travel_001
*      ENTITY travel
*      ALL FIELDS WITH VALUE #( ( TravelUUID = '7F660030AF51861C1800D2EE67CAB9FB' ) ) "00000034
*      RESULT DATA(travels).
*
*    out->write( travels ).

    " step 4 - READ by Association
*    READ ENTITIES OF ZI_RAP_Travel_001
*      ENTITY travel BY \_Booking
*      ALL FIELDS WITH VALUE #( ( TravelUUID = '7F660030AF51861C1800D2EE67CAB9FB' ) ) "00000034
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

  " step 5 - Unsuccessful READ
     READ ENTITIES OF ZI_RAP_Travel_001
       ENTITY travel
         ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
       RESULT DATA(travels)
       FAILED DATA(failed)
       REPORTED DATA(reported).

     out->write( travels ).
     out->write( failed ).    " complex structures not supported by the console output
     out->write( reported ).  " complex structures not supported by the console output





  ENDMETHOD.

ENDCLASS.
