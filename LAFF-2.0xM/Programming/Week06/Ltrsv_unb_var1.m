
% Copyright 2020 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ b_out ] = Ltrsv_unb_var1( L, b )

    [ LTL, LTR, ...
      LBL, LBR ] = FLA_Part_2x2( L, ...
                                 0, 0, 'FLA_TL' );
  
    [ bT, ...
      bB ] = FLA_Part_2x1( b, ...
                           0, 'FLA_TOP' );
  
    while ( size( LTL, 1 ) < size( L, 1 ) )
  
      [ L00,  l01,      L02,  ...
        l10t, lambda11, l12t, ...
        L20,  l21,      L22 ] = FLA_Repart_2x2_to_3x3( LTL, LTR, ...
                                                       LBL, LBR, ...
                                                       1, 1, 'FLA_BR' );
  
      [ b0, ...
        beta1, ...
        b2 ] = FLA_Repart_2x1_to_3x1( bT, ...
                                      bB, ...
                                      1, 'FLA_BOTTOM' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      b2 = laff_axpy( -1 * beta1, l21, b2 );
      

      % axpy

      % a = -1 * beta1;
      % x = l21;
      % y = b2;

      % y = a * x + y;
      
      % b2 = y;
    
      %------------------------------------------------------------%
  
      [ LTL, LTR, ...
        LBL, LBR ] = FLA_Cont_with_3x3_to_2x2( L00,  l01,      L02,  ...
                                               l10t, lambda11, l12t, ...
                                               L20,  l21,      L22, ...
                                               'FLA_TL' );
  
      [ bT, ...
        bB ] = FLA_Cont_with_3x1_to_2x1( b0, ...
                                         beta1, ...
                                         b2, ...
                                         'FLA_TOP' );
  
    end
  
    b_out = [ bT
              bB ];
  
  return
  