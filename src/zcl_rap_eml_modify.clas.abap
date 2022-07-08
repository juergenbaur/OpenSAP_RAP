CLASS zcl_rap_eml_modify DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_modify IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZI_RAP_Travel_001
*       ENTITY travel
*         UPDATE
*           SET FIELDS WITH VALUE
*             #( ( TravelUUID  = '7F660030AF51861C1800D2EE67CAB9FB'   "00000034
*                  Description = 'I like RAP@openSAP' ) )
*
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*     out->write( 'Update done' ).
*
*     " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_001
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

    " step 7 - MODIFY Create
    MODIFY ENTITIES OF ZI_RAP_Travel_001
      ENTITY travel
        CREATE
          SET FIELDS WITH VALUE
            #( ( %cid        = 'MyContentID_1'
                 AgencyID    = '70012'
                 CustomerID  = '14'
                 BeginDate   = cl_abap_context_info=>get_system_date( )
                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
                 Description = 'I like RAP@openSAP' ) )

     MAPPED DATA(mapped)
     FAILED DATA(failed)
     REPORTED DATA(reported).

    out->write( mapped-travel ).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_001
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Create done' ).


    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_001
      ENTITY travel
        DELETE FROM
          VALUE
             #( ( TravelUUID  = mapped-travel[ 1 ]-TravelUUID  ) )

     FAILED failed
     REPORTED reported.

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_001
      FAILED     failed_commit
      REPORTED   reported_commit.

    out->write( 'Delete done' ).
  ENDMETHOD.
ENDCLASS.
