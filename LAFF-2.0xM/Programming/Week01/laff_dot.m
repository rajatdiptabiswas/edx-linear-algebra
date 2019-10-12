function [ alpha ] = laff_dot( x, y )

% y = laff_dot( x, y ) calculates the dot product of vectors x and y

% Extract the row and column sizes of x and y
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% Make sure x and y are vectors
if ~isvector( x )
    disp('Error : x not a vector');
    alpha = 'FAILED';
    return
end
if ~isvector( y )
    disp('Error : y not a vector');
    alpha = 'FAILED';
    return
end

% Make sure x and y are (row or column) vectors of equal length
if ( m_x ~= 1 && n_x ~= 1 ) | ( m_y ~= 1 && n_y ~= 1 )
    alpha = 'FAILED';
    return
end
if ( m_x * n_x ~= m_y * n_y )
    alpha = 'FAILED';
    return
end

alpha = 0;

for i = 1:max(m_x,n_x)
    alpha += x(i) * y(i);
end

return
end
