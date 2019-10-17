% Stacy Day comp469 Project4
% This program finds a solution to the 3D 8
% queens problem. That is, the problem of placing 8 queens on an 8x8x8
% chessboard so that no two queens attack each other. The prototype
% board is passed in as a list with the rows instantiated from 1 to 8,
% and a corresponding variable for each column. The Prolog program
% instantiates those column variables as it finds the solution.

queens([]).					      % when place queen in empty list, solution found.

queens([Row/Col/Ver|Rest]):-			      % otherwise, for each row
	queens(Rest),				      % place queen in each higher #ed row
	member(Col,[1,2,3,4,5,6,7,8]),		      % pick one of the possible column positions
	safe(Row/Col,Rest),			      % and see if that is a safe position w/out considering vertical
	member(Ver,[1,2,3,4,5,6,7,8]),		      % now pick one of the possible vertical positions
	safe(Row/Col/Ver,Rest).			      % and see if that is a safe position

safe(Anything,[]).				      % the empty board is always safe

safe(Row/Col,[Row1/Col1|Rest]) :-                     % see if attack the queen in next row down
	Col=\=Col1,                                   % same column?
	Col1-Col=\=Row1-Row,                          % check diagonals
	Col1-Col=\=Row-Row1,
	safe(Row/Col,Rest),!.

safe(Row/Col/Ver,[Row1/Col1/Ver1|Rest]):-	      % see if attack the queen in next row/col down
	Col=\=Col1,				      % same column?
	Ver=\=Ver1,                                   % same row?
	Col1-Col=\=Row1-Row,			      % check diagonals
	Col1-Col=\=Row-Row1,
	Ver1-Ver=\=Row1-Row,
	Ver1-Ver=\=Row-Row1,
	Col1-Col=\=Ver1-Ver,
	Col1-Col=\=Ver-Ver1,
	safe(Row/Col/Ver,Rest).			      % no attack on next row/col, try the rest of board

member(X,[X|Tail]).                                   % member will pick successive column and vertical values

member(X,[Head|Tail]):-
	member(X,Tail).

board([1/C1/V1,2/C2/V2,3/C3/V3,4/C4/V4,5/C5/V5,6/C6/V6,7/C7/V7,8/C8/V8]).     % prototype board
