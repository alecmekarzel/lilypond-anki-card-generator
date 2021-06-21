\version "2.18.2"
\include "utilities.ly"

% RELEVANT LINKS
% http://lilypond.org/doc/v2.18/Documentation/notation/visibility-of-objects

% ----------------
% COMPONENT STYLES
% ----------------
hideTimeSignature = {
	\override Staff.TimeSignature.color = #white
	\override Staff.TimeSignature.layer = #-1
	% or reference http://lilypond.org/doc/v2.18/Documentation/45/lily-fb74c9cc.ly

}


% -------------
% GLOBAL STYLES
% -------------
global = {
	\hideTimeSignature
}

% ---------
% EXERCISES
% ---------
% Define our musicList function, utilizing another function
#(define musicList (makeMusicList (list


	#{ \relative c' { \global a } #}
	#{ \relative c' { \global b } #}
	#{ \relative c' { \global c } #}
	#{ \relative c' { \global d } #}


	#{ \relative c' { \global e } #}
	#{ \relative c' { \global f } #}
	#{ \relative c'' { \global g } #}
	#{ \relative c'' { \global a } #}
	#{ \relative c'' { \global b } #}
	#{ \relative c'' { \global c } #}
	#{ \relative c'' { \global d } #}
	#{ \relative c'' { \global e } #}
	#{ \relative c'' { \global f } #}


	#{ \relative c''' { \global g } #}
	#{ \relative c''' { \global a } #}
	#{ \relative c''' { \global b } #}
	#{ \relative c''' { \global c } #}
	#{ \relative c''' { \global d } #}
	#{ \relative c''' { \global e } #}


	#{ \relative c''' { \global f } #}
	#{ \relative c'''' { \global g } #}
	#{ \relative c'''' { \global a } #}
	#{ \relative c'''' { \global b } #}


	#{ \relative c' { \global \clef bass e } #}
	#{ \relative c' { \global \clef bass d } #}
	#{ \relative c' { \global \clef bass c } #}
	#{ \relative c' { \global \clef bass b } #}


	#{ \relative c' { \global \clef bass a } #}
	#{ \relative c' { \global \clef bass g } #}
	#{ \relative c { \global \clef bass f } #}
	#{ \relative c { \global \clef bass e } #}
	#{ \relative c { \global \clef bass d } #}
	#{ \relative c { \global \clef bass c } #}
	#{ \relative c { \global \clef bass b } #}
	#{ \relative c { \global \clef bass a } #}
	#{ \relative c { \global \clef bass g } #}


	#{ \relative c, { \global \clef bass f } #}
	#{ \relative c, { \global \clef bass e } #}
	#{ \relative c, { \global \clef bass d } #}
	#{ \relative c, { \global \clef bass c } #}
	#{ \relative c, { \global \clef bass b } #}
	#{ \relative c, { \global \clef bass a } #}


	#{ \relative c, { \global \clef bass g } #}
	#{ \relative c,, { \global \clef bass f } #}
	#{ \relative c,, { \global \clef bass e } #}
	#{ \relative c,, { \global \clef bass d } #}

)))

% Invoke our musicList function, triggering and returning a result
$@musicList
