canvas actions
showDenyFeedbackFor: aController
	"Return something that understands #remove, or nil to not show any feedback."

	^ OKAcceptDenyFeedbackBuilder denyFeedbackFor: self figure