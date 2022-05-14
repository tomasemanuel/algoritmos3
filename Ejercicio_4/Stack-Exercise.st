!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:47:12'!
assertFindIsCaseSensitive! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:45:59'!
assertFindReturnsACollectionWithMoreThanOnePrefix! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:45:45'!
assertFindReturnsACollectionWithOnePrefix! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:48:27'!
assertFindReturnsACollectionWithoutPrefixes! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:55:36'!
assertFindWithAPrefixWithWhiteSpacesGivesAnError! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:53:42'!
assertFindWithAnEmptyPrefixGivesAnError! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:44:22'!
assertSentenceFinderByPrefixInitializeWithTheSameStackGiven! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:47:48'!
assertThatStackDoesntChangeAfterFind! !


!classDefinition: #Estado category: 'Stack-Exercise'!
Object subclass: #Estado
	instanceVariableNames: 'contenido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Estado methodsFor: 'as yet unclassified' stamp: 'te 5/12/2022 20:32:13'!
initializeWith: unContenido
	contenido := unContenido.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Estado class' category: 'Stack-Exercise'!
Estado class
	instanceVariableNames: ''!

!Estado class methodsFor: 'as yet unclassified' stamp: 'te 5/12/2022 21:09:59'!
with: unContenido
	|subclaseEncontrada|
	subclaseEncontrada := Estado subclasses detect:[:subclass| subclass includes: unContenido ].
	^subclaseEncontrada new initializeWith: unContenido. 
"
	(unContenido isEmpty )ifTrue:[^Vacio new initializeWith: unContenido].
	^NoVacio new initializeWith: unContenido."
	! !


!classDefinition: #NoVacio category: 'Stack-Exercise'!
Estado subclass: #NoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoVacio methodsFor: 'as yet unclassified' stamp: 'te 5/12/2022 20:36:12'!
MMM
	^contenido last.
	"^pila at: self size"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoVacio class' category: 'Stack-Exercise'!
NoVacio class
	instanceVariableNames: ''!

!NoVacio class methodsFor: 'as yet unclassified' stamp: 'te 5/12/2022 21:11:35'!
includes: unContenido
	^ unContenido isEmpty not.! !


!classDefinition: #Vacio category: 'Stack-Exercise'!
Estado subclass: #Vacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Vacio methodsFor: 'as yet unclassified' stamp: 'te 5/12/2022 19:58:50'!
MMM
	self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vacio class' category: 'Stack-Exercise'!
Vacio class
	instanceVariableNames: ''!

!Vacio class methodsFor: 'as yet unclassified' stamp: 'te 5/12/2022 21:07:53'!
includes: unContenido
	^ unContenido isEmpty.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contenido estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'te 5/12/2022 20:21:55'!
isEmpty
	^contenido isEmpty.! !


!OOStack methodsFor: 'accessing' stamp: 'te 5/12/2022 20:22:05'!
size
	^contenido size.! !

!OOStack methodsFor: 'accessing' stamp: 'te 5/12/2022 20:37:56'!
top 
	"(self isEmpty) ifTrue:[self error: OOStack stackEmptyErrorDescription]
	ifFalse: [^pila at: self size]"
	^estado MMM.
	"^contenido at: self size"! !


!OOStack methodsFor: 'popAndPush' stamp: 'te 5/12/2022 20:45:59'!
pop
	"Vacia mmm."
	"(self isEmpty) ifTrue:[self error: OOStack stackEmptyErrorDescription ]
	ifFalse: [^pila removeLast]. "
	"|ultimo|
	ultimo := self top."
	|ultimo|
	
	ultimo := self top.
	contenido removeLast.
	estado:= Estado with: contenido.
	^ultimo.  ! !

!OOStack methodsFor: 'popAndPush' stamp: 'te 5/12/2022 20:50:04'!
push: aString 
	contenido add: aString. 
	estado:= Estado with: contenido.! !


!OOStack methodsFor: 'initialization' stamp: 'te 5/12/2022 20:15:10'!
initialize

	contenido := OrderedCollection new.
	estado := Vacio new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'pila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:32:12'!
devolverOOStack
	^pila! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:35:01'!
find: aPrefix

	"Dado un prefijo se encarga de devolver todas las oraciones almacenadas en la pila que contengan dicho prefijo."
	
	|pilaAux palabrasConElPrefix|
	
	pilaAux := OOStack new.
	palabrasConElPrefix := Collection new.
	 
	pila size timesRepeat: [
		pilaAux push: (pila pop).
		(pilaAux top beginsWith: aPrefix) ifTrue: [palabrasConElPrefix add: (pilaAux top)].
		].
	pilaAux size timesRepeat: [pila push: (pilaAux pop)].
	^palabrasConElPrefix. ! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:13:41'!
initializeWith: anOOStack
	pila := anOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'FH 5/14/2022 13:13:20'!
with: anOOStack
	^self initializeWith: anOOStack.! !
