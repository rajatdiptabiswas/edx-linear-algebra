
% Copyright 2020 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ x_out ] = Trmv_un_unb_var1( U, x )

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Part_2x2( U, ...
                                 0, 0, 'FLA_TL' );
  
    [ xT, ...
      xB ] = FLA_Part_2x1( x, ...
                           0, 'FLA_TOP' );
  
    while ( size( UTL, 1 ) < size( U, 1 ) )
  
      [ U00,  u01,       U02,  ...
        u10t, upsilon11, u12t, ...
        U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                        UBL, UBR, ...
                                                        1, 1, 'FLA_BR' );
  
      [ x0, ...
        chi1, ...
        x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                      xB, ...
                                      1, 'FLA_BOTTOM' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      chi1 = laff_dot(upsilon11, chi1);
      chi1 = laff_dots(x2, u12t, chi1);
  
      %------------------------------------------------------------%
  
      [ UTL, UTR, ...
        UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                               u10t, upsilon11, u12t, ...
                                               U20,  u21,       U22, ...
                                               'FLA_TL' );
  
      [ xT, ...
        xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                         chi1, ...
                                         x2, ...
                                         'FLA_TOP' );
  
    end
  
    x_out = [ xT
              xB ];
  
  return
  