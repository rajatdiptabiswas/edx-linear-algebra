
function [ A_out, b_out ] = Solve( A, b )

    % Computes the LU factorization of matrix A, A = LU
    % overwriting the upper triangular part of A with U
    % and the strictly lower triangular part of A with 
    % the strictly lower triangular part of L. 
    A_out = LU_unb_var5( A );
    
    % L -> Unit Lower Triangular Matrix
    L = tril( A_out, -1 ) + eye( size( A, 1 ) );

    % U -> Upper Triangular Matrix
    U = triu( A_out );

    % Solve Ly = b for y
    y = Ltrsv_unb_var1( L, b );

    % Solve Ux = y for x
    x = Utrsv_unb_var1( U, y );

    % Returning answer
    b_out = x;

  return