\version "2.18.2"
\include "utilities.ly"

% Create variables, storing Lilypond expressions within them
% so that those expressions can be easily referenced within our
% scheme expressions, which are then rendered
dango = \relative c'' {
	f8( ees as4)
}

keyAndTempo = {
	\key aes \major \tempo "Moderato" 4 = 100
}

% Define our musicList function, utilizing another function
#(define musicList (makeMusicList (list
	
  #{ \relative c''' { \keyAndTempo \dango aes4( bes) bes( c) aes( ees) } #}

)))

% Invoke our musicList function, triggering and returning a result
$@musicList
