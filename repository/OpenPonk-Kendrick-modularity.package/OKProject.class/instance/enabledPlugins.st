hooks
enabledPlugins
	^ enabledPlugins
		ifNil: [ | enabledPluginKinds |
			enabledPluginKinds := {OKFsmCompositionPlugin.
			OKFsmKendrickModelPlugin}.
			enabledPlugins := super enabledPlugins
				select: [ :each | enabledPluginKinds includes: each class ] ]