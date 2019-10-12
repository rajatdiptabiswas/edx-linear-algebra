function [ y_out ] = laff_axpy( alpha, x, y )

% Extract the row and column sizes of x and y
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% Make sure alpha is scalar and x, y are vectors
if ~isscalar( alpha )
    disp('Error : alpha not a scalar');
    y_out = 'FAILED';
    return
end
if ~isvector( x )
    disp('Error : x not a vector');
    y_out = 'FAILED';
    return
end
if ~isvector( y )
    disp('Error : y not a vector');
    y_out = 'FAILED';
    return
end

% Make sure x and y are (row or column) vectors of equal length
if ( m_x ~= 1 && n_x ~= 1 ) | ( m_y ~= 1 && n_y ~= 1 )
    y_out = 'FAILED';
    return
end
if ( m_x * n_x ~= m_y * n_y )
    y_out = 'FAILED';
    return
end

for i = 1:max(m_x,n_x)
    y(i) = alpha * x(i) + y(i);
end

% Return the updated y in y_out
y_out = y;

return
end
