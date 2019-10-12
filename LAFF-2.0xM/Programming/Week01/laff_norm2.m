function [ alpha ] = laff_norm2( x )

% y = laff_norm2( x ) calculates the vector length of x

% Extract the row and column size of x
[ m_x, n_x ] = size( x );

% Make sure x is a vector
if ~isvector( x )
    disp('Error : x not a vector');
    alpha = 'FAILED';
    return
end

% alpha = 0.0;
% for i = 1:max(m_x,n_x)
%     alpha += x(i) * x(i);
% end

% alpha = sqrt(alpha);

alpha = sqrt( laff_dot(x, x) );

return
end
