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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/14/2022 17:17:12'!
test01assertFindIsCaseSensitive
    |stack finder colection wordLowerCase wordUpperCase|
    wordLowerCase := 'manzana'.
    wordUpperCase := 'Manzana'.
    stack := OOStack new.

    stack push: wordLowerCase.
    stack push: wordUpperCase.
    finder := SentenceFinderByPrefix with: stack.
    colection := finder find: wordUpperCase.
    self deny: (colection includes: wordLowerCase).
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/14/2022 17:17:34'!
test02assertFindReturnsAnEmptyCollection
    |stack finder colection|

    stack := OOStack new.

    stack push: 'anana'.
    stack push: 'buenasNoches'.
    stack push: 'manzana'.
    stack push: 'mandarina'.
    finder := SentenceFinderByPrefix with: stack.
    colection := finder find: 'r'.
    self assert: colection isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/14/2022 17:17:54'!
test03assertFindReturnsACollectionWithOneWord
    |stack finder colection|

    stack := OOStack new.

    stack push: 'anana'.
    stack push: 'buenasNoches'.
    stack push: 'manzana'.
    stack push: 'mandarina'.
    finder := SentenceFinderByPrefix with: stack.
    colection := finder find: 'b'.
    self assert: colection includes: 'buenasNoches'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/14/2022 17:17:58'!
test04assertFindReturnsACollectionWithMoreThanOnePrefix
    |stack finder colection|

    stack := OOStack new.

    stack push: 'anana'.
    stack push: 'buenasNoches'.
    stack push: 'manzana'.
    stack push: 'mandarina'.
    finder := SentenceFinderByPrefix with: stack.
    colection := finder find: 'm'.
    self assert: ( (colection includes: 'manzana') and: (colection includes: 'mandarina')).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FH 5/14/2022 17:57:03'!
test05assertFindWithAPrefixWithWithSpacesGivesAnError
	
	| stack finder |
	stack := OOStack new.
	finder := SentenceFinderByPrefix with: stack.
	self
		should: [ finder find:'hola ']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefijoErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FH 5/14/2022 17:57:03'!
test06assertFindWithAnEmptyPrefixGivesAnError

	| stack finder |
	stack := OOStack new.
	finder := SentenceFinderByPrefix with: stack.
	self
		should: [ finder find:'']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefijoErrorDescription ]
	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/14/2022 16:24:08'!
test07assertSentenceFinderByPrefixInitializeWithTheSameStackGiven
		
	| stack finder |
	stack := OOStack new.
	finder := SentenceFinderByPrefix with: stack.
	self assert: stack = finder devolverOOStack .! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/14/2022 16:23:06'!
test08assertThatStackDoesntChangeAfterFind
	| stack finder stackFinder firstPushedObject secondPushedObject|
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	finder := SentenceFinderByPrefix with: stack.
	finder find:'fi'.
	stackFinder := finder devolverOOStack .
	self assert: stackFinder pop = secondPushedObject.
	self assert: stackFinder pop = firstPushedObject.! !


!classDefinition: #Estado category: 'Stack-Exercise'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Estado methodsFor: 'testing' stamp: 'FH 5/14/2022 18:07:55'!
ErrorIfEmpty
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Estado class' category: 'Stack-Exercise'!
Estado class
	instanceVariableNames: ''!

!Estado class methodsFor: 'instance initialization' stamp: 'FH 5/14/2022 18:13:48'!
with: unContenido
	|subclaseEncontrada|
	subclaseEncontrada := Estado subclasses detect:[:subclass| subclass includes: unContenido ].
	^subclaseEncontrada new. 
	! !


!classDefinition: #NoVacio category: 'Stack-Exercise'!
Estado subclass: #NoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoVacio methodsFor: 'testing' stamp: 'FH 5/14/2022 18:10:29'!
ErrorIfEmpty
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoVacio class' category: 'Stack-Exercise'!
NoVacio class
	instanceVariableNames: ''!

!NoVacio class methodsFor: 'testing' stamp: 'te 5/12/2022 21:11:35'!
includes: unContenido
	^ unContenido isEmpty not.! !


!classDefinition: #Vacio category: 'Stack-Exercise'!
Estado subclass: #Vacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Vacio methodsFor: 'testing' stamp: 'FH 5/14/2022 18:07:55'!
ErrorIfEmpty
	self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vacio class' category: 'Stack-Exercise'!
Vacio class
	instanceVariableNames: ''!

!Vacio class methodsFor: 'testing' stamp: 'te 5/12/2022 21:07:53'!
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

!OOStack methodsFor: 'accessing' stamp: 'FH 5/14/2022 18:08:32'!
top 
	estado ErrorIfEmpty.
	^contenido at: self size! !


!OOStack methodsFor: 'popAndPush' stamp: 'FH 5/14/2022 18:08:45'!
pop
	|ultimo|
	
	ultimo := self top.
	contenido removeLast.
	estado:= Estado with: self.
	^ultimo.  ! !

!OOStack methodsFor: 'popAndPush' stamp: 'FH 5/14/2022 18:02:43'!
push: aString 
	contenido add: aString. 
	estado:= Estado with: self.! !


!OOStack methodsFor: 'initialization' stamp: 'FH 5/14/2022 18:02:15'!
initialize

	contenido := OrderedCollection new.
	estado := Estado with: self.! !

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

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'FH 5/14/2022 13:32:12'!
devolverOOStack
	^pila! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'FH 5/14/2022 18:21:27'!
find: aPrefix

	"Dado un prefijo se encarga de devolver todas las oraciones almacenadas en la pila que contengan dicho prefijo."
	
	|pilaAux palabrasConElPrefix|

	(aPrefix = '')ifTrue:[self error: SentenceFinderByPrefix PrefijoErrorDescription].
	(aPrefix includes: $ )ifTrue:[self error: SentenceFinderByPrefix PrefijoErrorDescription].
	
	pilaAux := OOStack new.
	palabrasConElPrefix := OrderedCollection new.
	 
	pila size timesRepeat: [
		pilaAux push: (pila pop).
		(pilaAux top beginsWith: aPrefix) ifTrue: [palabrasConElPrefix add: (pilaAux top)].
		].
	pilaAux size timesRepeat: [pila push: (pilaAux pop)].
	^palabrasConElPrefix.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FH 5/14/2022 13:13:41'!
initializeWith: anOOStack
	pila := anOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance initialization' stamp: 'Te 5/14/2022 16:06:43'!
with: anOOStack
	^self new initializeWith: anOOStack.! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FH 5/14/2022 17:57:03'!
PrefijoErrorDescription
	^ 'Prefijo no puede tener espacio ni estar vacio'.! !
