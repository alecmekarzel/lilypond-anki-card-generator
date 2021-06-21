% FILE INFO
% This file acts as a formatter, or a header
% before we import our main lilypond file to convert it to Anki

% It contains functions, that are imported into our lilypond file...
% we then invoke these scheme functions within that file via a # sign
% where a list is then made, and separated for our renderings

% RELEVANT LINKS
% http://lilypond.org/doc/v2.18/Documentation/source/Documentation/internals/scheme-functions
% http://lilypond.org/doc/v2.18/Documentation/notation/technical-glossary
% http://lilypond.org/doc/v2.19/Documentation/usage/an-example-of-a-musicological-document

% NOTES
% In Scheme, the lambda function is just a way of defining a function without giving it a name.
% In Scheme, booleans are represented by #t and #f

% ---------
% VARIABLES
% ---------

easyLayout = \layout { \easyHeadsOn }
midiOutput = \midi { }
% midiOutput = \unfoldRepeats \articulate \midi { }


% ----------------
% CUSTOM FUNCTIONS
% ----------------

% Return score with music encapsulated in it.
#(define scorifyMusicList (lambda (musicList)
  (map ly:make-score musicList)))

% 'and' used here to give the lambda the right return value for map
#(define easyScorifyMusicList (lambda (musicList)
  (map (lambda (score)
    (and
      (ly:score-add-output-def! score easyLayout)
      (ly:score-add-output-def! score midiOutput) score))
    (scorifyMusicList musicList))))

#(define bookifyScore (lambda (score)
  (ly:make-book $defaultpaper $defaultheader score)))

% set-global-staff-size returns false i guess
#(define cardifyMusicList (lambda (musicList)
  (or
    (set-global-staff-size 50)
    (and
      (set-default-paper-size "a0" 'landscape)
      (merge
        (map bookifyScore (scorifyMusicList musicList))
        (map bookifyScore (easyScorifyMusicList musicList)))))))

% use -e '(define cardify #f)' at command line to disable to cardify
#(use-modules (guile-user))
#(define makeMusicList (if cardify cardifyMusicList scorifyMusicList))


% -----------------
% UTILITY FUNCTIONS
% -----------------

% https://stackoverflow.com/a/12647024
#(define (merge listA listB)
  (if (null? listA) listB
    (if (null? listB) listA
      (cons (car listA) (cons (car listB) (merge (cdr listA) (cdr listB)))))))
