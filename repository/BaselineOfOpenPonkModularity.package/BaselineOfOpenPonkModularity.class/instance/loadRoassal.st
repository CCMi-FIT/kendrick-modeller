as yet unclassified
loadRoassal
	self halt.
	Metacello new
		baseline: 'Roassal2';
		repository:
			'github://ObjectProfile/Roassal2:004ab6f3dfd41cf06526c57115ee42cc921e7668/src';
		onConflictUseLoaded;
		lock;
		load