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

% ABOVE STAFF
\relative c' { \global \clef bass e }
\relative c' { \global \clef bass d }
\relative c' { \global \clef bass c }
\relative c' { \global \clef bass b }

% STAFF
\relative c' { \global \clef bass a }
\relative c' { \global \clef bass g }
\relative c { \global \clef bass f }
\relative c { \global \clef bass e }
\relative c { \global \clef bass d }
\relative c { \global \clef bass c }
\relative c { \global \clef bass b }
\relative c { \global \clef bass a }
\relative c { \global \clef bass g }

% BELOW STAFF
\relative c, { \global \clef bass f }
\relative c, { \global \clef bass e }
\relative c, { \global \clef bass d }
\relative c, { \global \clef bass c }
\relative c, { \global \clef bass b }
\relative c, { \global \clef bass a }

% REALLY BELOW STAFF
\relative c, { \global \clef bass g }
\relative c,, { \global \clef bass f }
\relative c,, { \global \clef bass e }
\relative c,, { \global \clef bass d }
