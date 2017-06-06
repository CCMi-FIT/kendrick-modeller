announcements
announceUpdated
	announcer ifNil: [ ^ announcer := Announcer new ].
	announcer announce: OPModelContentReplaced