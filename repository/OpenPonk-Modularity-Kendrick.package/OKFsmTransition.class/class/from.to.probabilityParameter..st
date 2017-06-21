instance creation
from: aSource to: aTarget probabilityParameter: aString
	^ self new
		source: aSource;
		target: aTarget;
		probability: aString;
		yourself