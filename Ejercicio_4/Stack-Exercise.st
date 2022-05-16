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
	instanceVariableNames: 'primerPalabra segundaPalabra terceraPalabra cuartaPalabra stackWithFourElements stackWithNoElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:38:46'!
createAnStackWithFourElements
	|stack|
	stack := OOStack new.
	    stack push: primerPalabra.
	    stack push: segundaPalabra.
	    stack push: terceraPalabra.
	    stack push: cuartaPalabra.	
	^stack! !

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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:49:49'!
test02assertFindReturnsAnEmptyCollection

    |finder colection|

    finder := SentenceFinderByPrefix with: stackWithNoElements.
    colection := finder find: 'r'.
    self assert: colection isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:53:51'!
test03assertFindReturnsACollectionWithOneWord

    |finder colection|
    finder := SentenceFinderByPrefix with: stackWithFourElements.
    colection := finder find: 'm'.
    self assert: colection includes: 'manzana'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:50:31'!
test04assertFindReturnsACollectionWithMoreThanOnePrefix

    |finder colection|
    finder := SentenceFinderByPrefix with: stackWithFourElements.
    colection := finder find: 'm'.
    self assert: ( (colection includes: 'manzana') and: (colection includes: 'mandarina')).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:34:16'!
test05assertFindWithAPrefixWithAFinalSpaceGivesAnError
	
	self assertFailsWithAnInvalidPrefix: 'hola '.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:48:59'!
test05assertFindWithAPrefixWithASpaceBetweenWordsGivesAnError
	
	self assertFailsWithAnInvalidPrefix: 'buenas Noc'.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:34:30'!
test06assertFindWithAnEmptyPrefixGivesAnError

	self assertFailsWithAnInvalidPrefix: ''.
	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 22:49:13'!
test07assertSentenceFinderByPrefixInitializeWithTheSameStackGiven
		
	| finder |
	finder := SentenceFinderByPrefix with: stackWithFourElements.
	self assertStackDoesntChangeWithAStack:finder devolverOOStack.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 22:47:18'!
test08assertThatStackDoesntChangeAfterFind

	|finder|
	finder := SentenceFinderByPrefix with: stackWithFourElements.
	finder find:'fi'.
	self assertStackDoesntChange.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:51:58'!
test09assertFindWithAPrefixWithAnEmptyStackReturnsAnEmptyColection
	
	|finder colection|
	finder := SentenceFinderByPrefix with: stackWithNoElements.
    	colection := finder find: 'b'.
	self assert: colection isEmpty.! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'Te 5/15/2022 21:48:53'!
setUp
	primerPalabra := 'anana'.
	segundaPalabra := 'buenas Noches'.
	terceraPalabra := 'manzana'.
	cuartaPalabra := 'mandarina'.
	stackWithFourElements := self createAnStackWithFourElements.
	stackWithNoElements := OOStack new.! !


!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Te 5/15/2022 21:33:54'!
assertFailsWithAnInvalidPrefix:aPrefix
	| stack finder |
	stack := self createAnStackWithFourElements.
	finder := SentenceFinderByPrefix with: stack.
	self assertThatABlockFailsWithACertainError: [finder find:aPrefix ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Te 5/15/2022 22:47:06'!
assertStackDoesntChange
	self assert: stackWithFourElements pop = cuartaPalabra .
	self assert: stackWithFourElements pop = terceraPalabra .
	self assert: stackWithFourElements pop = segundaPalabra .
	self assert: stackWithFourElements pop = primerPalabra .! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Te 5/15/2022 22:49:40'!
assertStackDoesntChangeWithAStack:aStack
	self assert: aStack pop = cuartaPalabra .
	self assert: aStack pop = terceraPalabra .
	self assert: aStack pop = segundaPalabra .
	self assert: aStack pop = primerPalabra .! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Te 5/15/2022 21:27:34'!
assertThatABlock: aBlock FailsWithACertainError: aCertainError
	self
		should: [ aBlock]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefijoErrorDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'Te 5/15/2022 21:29:45'!
assertThatABlockFailsWithACertainError: aBlock 
	self
		should: aBlock
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefijoErrorDescription].! !


!classDefinition: #EstadoDeLaPila category: 'Stack-Exercise'!
Object subclass: #EstadoDeLaPila
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EstadoDeLaPila methodsFor: 'testing' stamp: 'Te 5/15/2022 22:43:11'!
returnWhichPushToUseIn:pila withAString:aString
	self subclassResponsibility.! !

!EstadoDeLaPila methodsFor: 'testing' stamp: 'Te 5/15/2022 20:31:57'!
returnWhichTopToUseIn:pila
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeLaPila class' category: 'Stack-Exercise'!
EstadoDeLaPila class
	instanceVariableNames: ''!

!EstadoDeLaPila class methodsFor: 'instance initialization' stamp: 'Te 5/15/2022 22:19:28'!
with: anStack
	|subclaseEncontrada|
	subclaseEncontrada := EstadoDeLaPila subclasses detect:[:subclass| subclass includes: anStack ].
	^subclaseEncontrada new. 
	! !


!classDefinition: #NoVacioConEspacio category: 'Stack-Exercise'!
EstadoDeLaPila subclass: #NoVacioConEspacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoVacioConEspacio methodsFor: 'accessing' stamp: 'Te 5/15/2022 22:37:52'!
returnWhichPushToUseIn:pila withAString:aString
	^pila pushWhenStackHasSpaceWithAString:aString.! !

!NoVacioConEspacio methodsFor: 'accessing' stamp: 'Te 5/15/2022 22:44:39'!
returnWhichTopToUseIn:pila
	^pila topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoVacioConEspacio class' category: 'Stack-Exercise'!
NoVacioConEspacio class
	instanceVariableNames: ''!

!NoVacioConEspacio class methodsFor: 'testing' stamp: 'Te 5/15/2022 22:53:25'!
includes: anStack

	^ anStack isEmpty not and:[anStack withSpace].! !


!classDefinition: #NoVacioSinEspacio category: 'Stack-Exercise'!
EstadoDeLaPila subclass: #NoVacioSinEspacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoVacioSinEspacio methodsFor: 'accessing' stamp: 'Te 5/15/2022 22:39:18'!
returnWhichPushToUseIn:pila withAString:aString
	^pila pushWhenStackIsFull .! !

!NoVacioSinEspacio methodsFor: 'accessing' stamp: 'Te 5/15/2022 22:44:39'!
returnWhichTopToUseIn:pila
	^pila topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoVacioSinEspacio class' category: 'Stack-Exercise'!
NoVacioSinEspacio class
	instanceVariableNames: ''!

!NoVacioSinEspacio class methodsFor: 'testing' stamp: 'Te 5/15/2022 22:53:13'!
includes: anStack
	"^ anStack isEmpty not.
	"
	
	^ anStack isEmpty not and:[anStack withSpace not].! !


!classDefinition: #Vacio category: 'Stack-Exercise'!
EstadoDeLaPila subclass: #Vacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Vacio methodsFor: 'accessing' stamp: 'Te 5/15/2022 22:39:51'!
returnWhichPushToUseIn:pila withAString:aString
	^pila pushWhenStackHasSpaceWithAString:aString.! !

!Vacio methodsFor: 'accessing' stamp: 'Te 5/15/2022 22:33:48'!
returnWhichTopToUseIn:pila
	^pila topWhenEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vacio class' category: 'Stack-Exercise'!
Vacio class
	instanceVariableNames: ''!

!Vacio class methodsFor: 'testing' stamp: 'Te 5/15/2022 21:14:44'!
includes: anStack
	^anStack isEmpty.! !


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

!OOStack methodsFor: 'accessing' stamp: 'Te 5/15/2022 20:33:59'!
top 
	^estado returnWhichTopToUseIn: self.! !


!OOStack methodsFor: 'popAndPush' stamp: 'Te 5/15/2022 20:11:05'!
pop
	|ultimo|
	
	ultimo := self top.
	contenido removeLast.
	estado:= EstadoDeLaPila with: self.
	^ultimo.  ! !

!OOStack methodsFor: 'popAndPush' stamp: 'Te 5/15/2022 23:01:38'!
push: aString 
	^estado returnWhichPushToUseIn: self withAString:aString.! !

!OOStack methodsFor: 'popAndPush' stamp: 'Te 5/15/2022 22:36:00'!
pushWhenStackHasSpaceWithAString:aString
	contenido add: aString. 
	estado:= EstadoDeLaPila with: self.! !


!OOStack methodsFor: 'initialization' stamp: 'Te 5/15/2022 20:11:05'!
initialize

	contenido := OrderedCollection new.
	estado := EstadoDeLaPila with: self.! !


!OOStack methodsFor: 'private' stamp: 'Te 5/15/2022 22:33:48'!
topWhenEmpty
	self error: OOStack stackEmptyErrorDescription
	! !

!OOStack methodsFor: 'private' stamp: 'Te 5/15/2022 22:44:39'!
topWhenNotEmpty
	^contenido at: self size
	! !

!OOStack methodsFor: 'private' stamp: 'Te 5/15/2022 22:21:25'!
withSpace
	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackLimitada category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimitada
	instanceVariableNames: 'limite'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimitada methodsFor: 'private' stamp: 'Te 5/15/2022 22:23:37'!
withSpace
	^ self size < limite.! !


!OOStackLimitada methodsFor: 'initialization' stamp: 'Te 5/15/2022 22:23:17'!
initializeWithALimit: unLimite
	contenido := OrderedCollection new.
	estado := EstadoDeLaPila with: self.
	limite := unLimite.
	! !


!OOStackLimitada methodsFor: 'push' stamp: 'Te 5/15/2022 22:35:16'!
pushWhenStackIsFull
	self error: OOStack stackFullErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimitada class' category: 'Stack-Exercise'!
OOStackLimitada class
	instanceVariableNames: ''!

!OOStackLimitada class methodsFor: 'as yet unclassified' stamp: 'Te 5/15/2022 22:31:54'!
stackFullErrorDescription
	 ^ 'Stack is full'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'pila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'FH 5/14/2022 13:32:12'!
devolverOOStack
	^pila! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'Te 5/15/2022 20:47:50'!
find: aPrefix

	"Dado un prefijo se encarga de devolver todas las oraciones almacenadas en la pila que contengan dicho prefijo."
	
	|palabrasConElPrefix|
	self aPrefixIsValid:aPrefix.
	 palabrasConElPrefix := self findWordsWithPrefix:aPrefix.
	^palabrasConElPrefix.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FH 5/14/2022 13:13:41'!
initializeWith: anOOStack
	pila := anOOStack.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Te 5/15/2022 20:49:31'!
aPrefixIsValid:aPrefix
	
	((aPrefix = '') or:(aPrefix includes: $ ))ifTrue:
		[self error: SentenceFinderByPrefix PrefijoErrorDescription].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Te 5/15/2022 20:46:12'!
findWordsWithPrefix:aPrefix

	|palabrasConElPrefix pilaAux|
	palabrasConElPrefix := OrderedCollection new.
	pilaAux := OOStack new.
		pila size timesRepeat: [
		pilaAux push: (pila pop).
		(pilaAux top beginsWith: aPrefix) ifTrue: 
			[palabrasConElPrefix add: (pilaAux top)]].
	self reconstructStack: pilaAux .
	
	^palabrasConElPrefix.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Te 5/15/2022 20:36:02'!
reconstructStack:anStack
	anStack size timesRepeat: [pila push: (anStack pop)]
	! !

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
