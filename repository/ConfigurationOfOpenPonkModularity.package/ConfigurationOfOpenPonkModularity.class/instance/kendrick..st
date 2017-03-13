symbolic versions
kendrick: spec
	<version: '0.0.1-kendrick'>
	spec
		for: #common
		do: [ spec
				project: 'Kendrick'
					with: [ spec
						className: 'ConfigurationOfKendrick';
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main' ];
				package: 'OpenPonk-Kendrick-modularity' with: [ spec requires: #('Kendrick') ] ]