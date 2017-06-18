hooks
enabledPlugins
	^ enabledPlugins
		ifNil: [ | enabledPluginKinds |
			enabledPluginKinds := {OKFsmKendrickModelPlugin.
			OKFsmKendrickConcernPlugin}.
			enabledPlugins := OPPluginRegistry default plugins select: [ :each | enabledPluginKinds includes: each class ] ]