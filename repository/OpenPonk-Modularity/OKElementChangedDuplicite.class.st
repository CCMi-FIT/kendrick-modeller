"
I am a subclass of OPElementChanged and I am used to indicate that for same user action, another announcement has been or will be made.

For example, if element is added, both OPElementAdded (for the new element) and OPElementChanged (for the container of that element) is usually announced. In modular tool, OPElementChangedDuplicite is used instead to reduce diplicite generating of resulting models.
"
Class {
	#name : #OKElementChangedDuplicite,
	#superclass : #OPElementChanged,
	#category : 'OpenPonk-Modularity-Announcements'
}
