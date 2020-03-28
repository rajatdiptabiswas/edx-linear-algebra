% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ A_out ] = Add_matrices_unb( A, B )

    [ AL, AR ] = FLA_Part_1x2( A, ...
                                 0, 'FLA_LEFT' );
  
    [ BL, BR ] = FLA_Part_1x2( B, ...
                                 0, 'FLA_LEFT' );
  
    while ( size( AL, 2 ) < size( A, 2 ) )
  
      [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                           1, 'FLA_RIGHT' );
  
      [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                           1, 'FLA_RIGHT' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      a1 = a1 + b1;

      %------------------------------------------------------------%
  
      [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                             'FLA_LEFT' );
  
      [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                             'FLA_LEFT' );
  
    end
  
    A_out = [ AL, AR ];
  
  return
  