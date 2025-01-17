% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ B_out ] = Transpose_alternative_unb( A, B )

    [ AT, ...
      AB ] = FLA_Part_2x1( A, ...
                           0, 'FLA_TOP' );
  
    [ BL, BR ] = FLA_Part_1x2( B, ...
                                 0, 'FLA_LEFT' );
  
    while ( size( AT, 1 ) < size( A, 1 ) )
  
      [ A0, ...
        a1t, ...
        A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                      AB, ...
                                      1, 'FLA_BOTTOM' );
  
      [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                           1, 'FLA_RIGHT' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      b1 = a1t';

      %------------------------------------------------------------%
  
      [ AT, ...
        AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                         a1t, ...
                                         A2, ...
                                         'FLA_TOP' );
  
      [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                             'FLA_LEFT' );
  
    end
  
    B_out = [ BL, BR ];
  
  return
  