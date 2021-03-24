*"* use this source file for your ABAP unit test classes
CLASS test_recursion DEFINITION
      FINAL
      FOR TESTING
      RISK LEVEL HARMLESS
      DURATION MEDIUM.
  PRIVATE SECTION.
    METHODS:
      elementary_recursion_1 FOR TESTING,
      elementary_recursion_2 FOR TESTING,
      elementary_recursion_3 FOR TESTING,
      elementary_recursion_4 FOR TESTING,
      elementary_recursion_5 FOR TESTING,
      elementary_recursion_6 FOR TESTING.
ENDCLASS.

CLASS test_recursion IMPLEMENTATION.
  METHOD elementary_recursion_1.
    DATA:
      result TYPE i.

    result = ztail_recursion=>factorial_1( 12 ).
  ENDMETHOD.

  METHOD elementary_recursion_2.
    DATA:
      result TYPE f.

    " Value 170 is max without overflow
    result = ztail_recursion=>factorial_2( '170.0' ).
  ENDMETHOD.

  METHOD elementary_recursion_3.
    DATA:
      result TYPE decfloat34.

    " Value 171 is max without overflow
    result = ztail_recursion=>factorial_3( '171.0' ).
  ENDMETHOD.

  METHOD elementary_recursion_4.
    DATA:
      result TYPE i.

    " Value 100000 is without overflow
*    result = ztail_recursion=>sum_n_1( 100000 ).
  ENDMETHOD.

  METHOD elementary_recursion_5.
    DATA:
      result TYPE f.

    " Value in the call get dump on stack memory! Good:)
*    result = ztail_recursion=>sum_n_2( '100000000.0' ).
  ENDMETHOD.

  METHOD elementary_recursion_6.
    DATA:
      result TYPE f.

    result = ztail_recursion=>sum_n_3( '5.0' ).
    cl_abap_unit_assert=>assert_equals( exp = '15.0' act = result ).

    " This call user tail recursion internally but a dump still occurs.
    " I conclude that the language does not support tail recursion.
    " You can see
*    result = ztail_recursion=>sum_n_3( '100000000.0' ).
  ENDMETHOD.
ENDCLASS.
