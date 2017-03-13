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
				configuration: #Kendrick
					with: [ spec
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main' ];
				package: 'OpenPonk-Kendrick-modularity'.
			spec group: 'default' with: #('OpenPonk' 'Kendrick' 'OpenPonk-Kendrick-modularity').
			spec group: 'kendrick' with: #('Kendrick' 'OpenPonk-Kendrick-modularity').
			spec group: 'openponk' with: #('OpenPonk' 'OpenPonk-Kendrick-modularity').
			spec group: 'package' with: #('OpenPonk-Kendrick-modularity') ]