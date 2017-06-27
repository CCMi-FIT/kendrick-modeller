announcing
dupliciteChanged
	"instead of OPElementChanged, use OKElementChangedDuplicite, to indicate that other announcement was made for a single user-made action, even if it means multiple changes for the model"
	
	self announce: (OKElementChangedDuplicite element: self)