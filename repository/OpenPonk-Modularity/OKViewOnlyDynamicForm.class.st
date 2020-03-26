"
I am dynamic form used for view-only editors. I am useful for cases where there is editing of model not allowed.
"
Class {
	#name : #OKViewOnlyDynamicForm,
	#superclass : #OPDynamicForm,
	#category : 'OpenPonk-Modularity-Spec'
}

{ #category : #private }
OKViewOnlyDynamicForm >> addControl: aControl [
	aControl disable.
	super addControl: aControl
]
