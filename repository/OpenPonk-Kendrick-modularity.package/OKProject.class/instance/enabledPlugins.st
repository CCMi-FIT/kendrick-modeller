hooks
enabledPlugins
	^ enabledPlugins
		ifNil: [ | enabledPluginKinds |
			enabledPluginKinds := {OKFsmKendrickModelPlugin.
			OKFsmKendrickConcernPlugin}.
			enabledPlugins := super enabledPlugins
				select: [ :each | enabledPluginKinds includes: each class ] ]