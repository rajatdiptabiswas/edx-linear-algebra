
% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ A_out ] = Scale_matrix_unb( beta, A )

    [ AT, ...
      AB ] = FLA_Part_2x1( A, ...
                           0, 'FLA_TOP' );
  
    while ( size( AT, 1 ) < size( A, 1 ) )
  
      [ A0, ...
        a1t, ...
        A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                      AB, ...
                                      1, 'FLA_BOTTOM' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      a1t = beta * a1t;

      %------------------------------------------------------------%
  
      [ AT, ...
        AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                         a1t, ...
                                         A2, ...
                                         'FLA_TOP' );
  
    end
  
    A_out = [ AT
              AB ];
  
  return