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

\relative c' \chords \chordmode { \global c1 }