baselines
baseline: spec
	<baseline>
	
	spec
		for: #common
		do: [ spec
				baseline: 'OpenPonk'
					with: [ spec
						loads: #complete;
						repository: 'github://openponk/openponk/repository' ];
				project: 'Kendrick'
					with: [ spec
						className: #ConfigurationOfKendrick;
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main' ];
				package: 'OpenPonk-Kendrick-modularity'
					with: [ spec requires: #('Kendrick' 'OpenPonk') ] ]