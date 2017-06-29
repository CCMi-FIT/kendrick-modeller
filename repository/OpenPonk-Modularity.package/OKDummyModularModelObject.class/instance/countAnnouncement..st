announce
countAnnouncement: aClass
	^ announcements count: [ :each | each isKindOf: aClass ]