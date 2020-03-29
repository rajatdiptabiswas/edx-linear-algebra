
% Copyright 2020 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Rajat Dipta Biswas
%                rdbiswas97@gmail.com

function [ y_out ] = Mvmult_n_unb_var2( A, x, y )

    [ AL, AR ] = FLA_Part_1x2( A, ...
                                 0, 'FLA_LEFT' );
  
    while ( size( AL, 2 ) < size( A, 2 ) )
  
      [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                           1, 'FLA_RIGHT' );
  
      %------------------------------------------------------------%
  
      %                       update line 1                        %
      %                             :                              %
      %                       update line n                        %
  
      y = laff_axpy(a1, x, y);

      %------------------------------------------------------------%
  
      [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                             'FLA_LEFT' );
  
    end
  
    y_out = y;
  
  
  return
  