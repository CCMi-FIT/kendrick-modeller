Class {
	#name : #OKFsmModuleLink,
	#superclass : #OKModuleLink,
	#category : #'Kendrick-Modeller-Kendrick-Models'
}

{ #category : #accessing }
OKFsmModuleLink >> externalKendrickModel [
	^ self linkedModel externalKendrickModel
]

{ #category : #testing }
OKFsmModuleLink >> isState [
	^ false
]

{ #category : #testing }
OKFsmModuleLink >> isTransition [
	^ false
]
