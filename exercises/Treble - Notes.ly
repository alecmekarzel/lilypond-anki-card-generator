\version "2.18.2"

% Component Styles
hideTimeSignature = {
	\override Staff.TimeSignature.color = #white
	\override Staff.TimeSignature.layer = #-1
}

% Global Styles
global = {
	\hideTimeSignature
}

% BELOW STAFF
\relative c' { \global a }
\relative c' { \global b }
\relative c' { \global c }
\relative c' { \global d }

% STAFF
\relative c' { \global e }
\relative c' { \global f }
\relative c'' { \global g }
\relative c'' { \global a }
\relative c'' { \global b }
\relative c'' { \global c }
\relative c'' { \global d }
\relative c'' { \global e }
\relative c'' { \global f }

% ABOVE STAFF
\relative c''' { \global g }
\relative c''' { \global a }
\relative c''' { \global b }
\relative c''' { \global c }
\relative c''' { \global d }
\relative c''' { \global e }

% REALLY ABOVE STAFF
\relative c''' { \global f }
\relative c'''' { \global g }
\relative c'''' { \global a }
\relative c'''' { \global b }