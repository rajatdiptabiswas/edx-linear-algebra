
% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ B_out ] = Transpose_unb( A, B )

    [ AL, AR ] = FLA_Part_1x2( A, ...
                                 0, 'FLA_LEFT' );
  
    [ BT, ...
      BB ] = FLA_Part_2x1( B, ...
                           0, 'FLA_TOP' );
  
    while ( size( AL, 2 ) < size( A, 2 ) )
  
      [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                           1, 'FLA_RIGHT' );
  
      [ B0, ...
        b1t, ...
        B2 ] = FLA_Repart_2x1_to_3x1( BT, ...
                                      BB, ...
                                      1, 'FLA_BOTTOM' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
    
      b1t = a1';

      %------------------------------------------------------------%
  
      [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                             'FLA_LEFT' );
  
      [ BT, ...
        BB ] = FLA_Cont_with_3x1_to_2x1( B0, ...
                                         b1t, ...
                                         B2, ...
                                         'FLA_TOP' );
  
    end
  
    B_out = [ BT
              BB ];
  
  return
  