instance creation
openForProjectController: aProjectController
	^ self new
		projectController: aProjectController;
		openWithSpec