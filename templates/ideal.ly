\version "2.18.2"
\language "english"

\paper {

}

\layout {
	\context {
		\Score
		timing = ##f
	}
	\context {
		\Staff
		\remove "Time_signature_engraver"
	}
}


/header {
	title = "My Score"
	subtitle = "subtitle"

	composer = "Composer"
}

\relative c' {

}
