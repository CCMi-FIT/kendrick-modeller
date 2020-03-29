Class {
	#name : #OKFsmKendrickModelController,
	#superclass : #OKFsmController,
	#category : #'Kendrick-Modeller-Kendrick-Controllers'
}

{ #category : #forms }
OKFsmKendrickModelController >> buildEditorForm: aForm [
	super buildEditorForm: aForm.
	(aForm addTextInput: 'Population size')
		text: self model populationSize;
		whenTextIsAccepted: [ :newValue | self model populationSize: (NumberParser parse: newValue onError: [ 0 ]) ].
	(aForm addButton: 'Additional code') action: [ self openAdditionalCodeEditor ].
	(aForm addTextInput: 'Simulate states')
		text: self model simulateStatesAsString;
		whenTextIsAccepted: [ :newValue | self model parseSimulateStates: newValue ].
	(aForm addTextInput: 'Simulation duration')
		text: self model simulationDuration;
		whenTextIsAccepted:
				[ :newValue | self model simulationDuration: (NumberParser parse: newValue onError: [ 0 ]) ].
	(aForm addTextInput: 'Simulation step size')
		text: self model simulationStepSize;
		whenTextIsAccepted:
				[ :newValue | self model simulationStepSize: (NumberParser parse: newValue onError: [ 0 ]) ]
]

{ #category : #initialization }
OKFsmKendrickModelController >> initializePalette: aPalette [
	aPalette addEntry
		label: 'Integrate concern';
		icon: OPIcons current dcOmlDiagramIcon;
		action: [ OKFsmIntegrationSelectionDialog openForPalette: aPalette ]
]

{ #category : #spec }
OKFsmKendrickModelController >> openAdditionalCodeEditor [
	OKFsmAdditionalCodeEditor openFor: model
]

{ #category : #hooks }
OKFsmKendrickModelController >> selectPossibleElementsFromModules [
	^ OrderedCollection new
]
