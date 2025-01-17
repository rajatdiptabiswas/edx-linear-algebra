
% Copyright 2019 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ A_out ] = Set_to_strictly_lower_triangular_matrix_unb( A )

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Part_2x2( A, ...
                                 0, 0, 'FLA_TL' );
  
    while ( size( ATL, 1 ) < size( A, 1 ) )
  
      [ A00,  a01,     A02,  ...
        a10t, alpha11, a12t, ...
        A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                      ABL, ABR, ...
                                                      1, 1, 'FLA_BR' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      alpha11 = laff_zerov( alpha11 );
      a01 = laff_zerov( a01 );
      % a12t = laff_zerov( a12t );

      %------------------------------------------------------------%
  
      [ ATL, ATR, ...
        ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                               a10t, alpha11, a12t, ...
                                               A20,  a21,     A22, ...
                                               'FLA_TL' );
  
    end
  
    A_out = [ ATL, ATR
              ABL, ABR ];
  
  return
  