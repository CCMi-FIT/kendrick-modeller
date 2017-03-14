opening
openEditorOn: aModel
	editor := self instantiate: self class editorClass.
	editor workbench: self.
	editor plugin: (self pluginRegistry pluginFor: aModel).
	self rebuildWidget.
	editor openModel: aModel.
	editor paletteModel rebuildWidget