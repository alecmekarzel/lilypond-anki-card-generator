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

% front
\new Staff <<
	\chords { c1:maj7 }
	\chordmode { \global c1:maj7 }
>>

% back
\new Staff <<
	\chords { c:5 }
	\chordmode { \global \easyHeadsOn c:5 }
>>


	
\new Staff <<
  \new ChordNames \chordmode {
    c1
    r1
    g1
    c1
    <c e g>
  }
  \chordmode {
    c1
    r1
    g1
    c1
    <c' e g>
  }
>>