format long

% Choose the maximum number of iterations of the Inverse Power Method 
% that will be performed. 
k = 20;

% Choose the eigenvalues
disp( 'input a vector of eigenvalues. e.g.: [ 4; 3; 2; 1 ]   ' );
eigs = input('');

n = size( eigs,1);

% Make sure that the last entry is equal to smallest in absolute value
[ eig_min ] = min( abs( eigs( 1:n-1 ) ) );
if eig_min < abs( eigs( n ) )
    abort( 'The last entry should be equal to smallest in absolute value.' );
end

% extract the number of eigenvalues
n = size( eigs, 1 );

[ A, V ] = CreateMatrixForEigenvalueProblem( eigs );

disp( 'Matrix A:' )
disp( A );

% Print V
disp( 'Matrix of eigenvectors:' );
disp( V );

% Print eigenvalues
disp( 'Eigenvalues:' );
disp( eigs );

% Create a random initial vector x, and normalize it to have unit length
x = rand( n, 1 );
x = x / norm( x );

disp( 'Initial random vector:' )
disp( x )

printf( '\n' )
disp( 'iteration' );
disp( 0 );
    
% Print the length of the component of x orthogonal to the eigenvector
% associated with the smallest eigenvalue (in magnitude)
disp( 'The length of the component of x orthogonal to V( :, n ) is ' );
disp( norm( x - x' * V( :, n ) * V( :, n ) ) );
    
% Compute the Rayleigh quotient (no need to divide by x' * x since x is
% of unit length)
disp( 'Rayleigh quotient:' );
disp( x' * A * x );

% Compute the LU factorization (with pivoting) of A
[ L, U, P ] = lu( A );

cont = 1;
% Perform at most k steps of the Inverse Power Method
for i=1:k
    cont = input( 'continue? (0=NO, return = YES)' );
    if cont == 0
        error( 'exiting' );
    end
    
    printf( '\n' )
    disp( 'iteration' );
    disp( i );
    
    % Next step of Inverse Power Method
    % x = A \ x;  Let's use the LU factorization instead.
    x = P * x;
    x = L \ x;
    x = U \ x;
    x = x / norm( x );
    
    % Print the length of the component of x orthogonal to the eigenvector
    % associated with the smallest eigenvalue (in magnitude)
    disp( 'The length of the component of x orthogonal to V( :, n ) is ' );
    disp( norm( x - x' * V( :, n ) * V( :, n ) ) );
    
    % Compute the Rayleigh quotient (no need to divide by x' * x since x is
    % of unit length)
    
    sigma = x' * A * x;
    disp( 'sigma (Rayleigh quotient):' );
    disp( sigma );
end

disp( 'Final vector x:' );
disp( x );

disp( 'A * x - sigma * x (should equal, approximately, the zero vector)' );
disp( A * x - sigma * x );

