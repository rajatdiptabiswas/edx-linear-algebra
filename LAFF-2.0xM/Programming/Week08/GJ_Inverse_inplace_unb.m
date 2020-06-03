
% Copyright 2020 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ A_out ] = GJ_Inverse_inplace_unb( A )

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
  
      % a01 = a01 / alpha11;
      a01 = laff_invscal( alpha11, a01 );
      % a21 = a21 / alpha11;
      a21 = laff_invscal( alpha11, a21 );

      % A02 = A02 - ( a01 * a12t );
      A02 = laff_ger( -1, a01, a12t, A02 );
      % A22 = A22 - ( a21 * a12t );
      A22 = laff_ger( -1, a21, a12t, A22 );

      % A00 = A00 - ( a01 * a10t );
      A00 = laff_ger( -1, a01, a10t, A00 );
      % A20 = A20 - ( a21 * a10t );
      A20 = laff_ger( -1, a21, a10t, A20 );

      % a01 = -a01;
      a01 = laff_scal( -1, a01 );
      % a21 = -a21;
      a21 = laff_scal( -1, a21 );

      %a12t = a12t / alpha11;
      a12t = laff_invscal( alpha11, a12t );

      % a10t = a10t / alpha11;
      a10t = laff_invscal( alpha11, a10t );

      % alpha11 = 1 / alpha11;
      alpha11 = 1 ./ alpha11;

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
  