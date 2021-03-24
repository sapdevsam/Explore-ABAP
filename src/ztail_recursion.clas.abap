CLASS ztail_recursion DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS factorial_1
      IMPORTING
        n             TYPE i
      RETURNING
        VALUE(result) TYPE i.
    CLASS-METHODS factorial_2
      IMPORTING
        n             TYPE f
      RETURNING
        VALUE(result) TYPE f.
    CLASS-METHODS factorial_3
      IMPORTING
        n             TYPE decfloat34
      RETURNING
        VALUE(result) TYPE decfloat34.
    CLASS-METHODS sum_n_1
      IMPORTING
        n             TYPE i
      RETURNING
        VALUE(result) TYPE i.
    CLASS-METHODS sum_n_2
      IMPORTING
        n             TYPE f
      RETURNING
        VALUE(result) TYPE f.
    CLASS-METHODS sum_n_3
      IMPORTING
        n             TYPE f
      RETURNING
        VALUE(result) TYPE f.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-METHODS sum_n_3_times
      IMPORTING
        n             TYPE f
        acc           TYPE f
      RETURNING
        VALUE(result) TYPE f.
ENDCLASS.

CLASS ztail_recursion IMPLEMENTATION.
  METHOD factorial_1.
    IF n = 1.
      result = n.
    ELSE.
      result = n * factorial_1( n - 1 ).
    ENDIF.
  ENDMETHOD.

  METHOD factorial_2.
    IF n = '1.0'.
      result = n.
    ELSE.
      result = n * factorial_2( n - '1.0' ).
    ENDIF.
  ENDMETHOD.

  METHOD factorial_3.
    IF n = '1.0'.
      result = n.
    ELSE.
      result = n * factorial_2( n - '1.0' ).
    ENDIF.
  ENDMETHOD.

  METHOD sum_n_1.
    IF n = 0.
      result = n.
    ELSE.
      result = n + sum_n_1( n - 1 ).
    ENDIF.
  ENDMETHOD.

  METHOD sum_n_2.
    IF n = '0.0'.
      result = n.
    ELSE.
      result = n + sum_n_2( n - '1.0' ).
    ENDIF.
  ENDMETHOD.

  METHOD sum_n_3.
    result = sum_n_3_times( n   = n
                            acc = '0.0' ).
  ENDMETHOD.

  METHOD sum_n_3_times.
    IF n = '0.0'.
      result = acc.
    ELSE.
      result = sum_n_3_times( n   = n - '1.0'
                              acc = acc + n ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
