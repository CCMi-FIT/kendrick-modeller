api
title
	| s p |
	s := ''.
	p := ''.
	project
		ifNotNil: [ project dirty
				ifTrue: [ s := '* ' ].
			s := s , project projectName , ' - '.
			p := project name ].
	^ s , 'OpenPonk-Modularity for ' , p