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

!OOStackTest methodsFor: 'test' stamp: 'FH 5/16/2022 17:33:15'!
test11LimitedStackCanStoreWithinLimit

	|limitedStack|
	
	limitedStack := OOStackLimitada new initializeWithALimit: 2.
	limitedStack push: 'something'.
	limitedStack push: 'another'.	
	self deny: limitedStack isEmpty.
	
	! !

!OOStackTest methodsFor: 'test' stamp: 'FH 5/16/2022 17:33:11'!
test12LimitedStackCannotStoreBeyondLimit

	|limitedStack|
	
	limitedStack := OOStackLimitada new initializeWithALimit: 2.
	limitedStack push: 'something'.
	limitedStack push: 'another'.	
	self
	should: [ limitedStack push: 'thisWillFail' ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText = OOStackLimitada stackFullErrorDescription].! !

!OOStackTest methodsFor: 'test' stamp: 'FH 5/16/2022 17:33:07'!
test13LimitedStackCanPushElementCorrectlyAfterBeingFull

	| stack firstPushedObject secondPushedObject thirdPushedObject|
	
	stack := OOStackLimitada new initializeWithALimit: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	stack push: thirdPushedObject.
	self assert: stack pop = thirdPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'Te 5/16/2022 11:54:59'!
test14LimitedStackCannotInitializeWithAString
	
	self assertErrorLimiteNoEsUnEntero: 'a'! !

!OOStackTest methodsFor: 'test' stamp: 'FH 5/16/2022 17:32:52'!
test15LimitedStackCannotInitializeWithANegativeNumber
	
	self assertErrorLimiteNoEsUnEntero: -4.! !


!OOStackTest methodsFor: 'private' stamp: 'Te 5/16/2022 11:54:33'!
assertErrorLimiteNoEsUnEntero:unLimiteIncorrecto
	|limitedStack|
	self
	should: [limitedStack := OOStackLimitada new initializeWithALimit: (unLimiteIncorrecto ).]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [ :anError |
		self assert: anError messageText = OOStackLimitada limitMustBeAnIntegerErrorDescription ].! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'primerPalabra segundaPalabra terceraPalabra cuartaPalabra stackWithFourElements stackWithNoElements'
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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/16/2022 10:41:45'!
test08assertThatStackDoesntChangeAfterFind

	|finder|
	finder := SentenceFinderByPrefix with: stackWithFourElements.
	finder find:'fi'.
	self assertStackDoesntChangeWithAStack: stackWithFourElements.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Te 5/15/2022 21:51:58'!
test09assertFindWithAPrefixWithAnEmptyStackReturnsAnEmptyColection
	
	|finder colection|
	finder := SentenceFinderByPrefix with: stackWithNoElements.
    	colection := finder find: 'b'.
	self assert: colection isEmpty.! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'FH 5/16/2022 17:26:54'!
assertFailsWithAnInvalidPrefix:aPrefix
	| stack finder |
	stack := self createAnStackWithFourElements.
	finder := SentenceFinderByPrefix with: stack.
	self assertThatABlockFailsWithAPrefixError: [finder find:aPrefix ]! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'Te 5/15/2022 22:49:40'!
assertStackDoesntChangeWithAStack:aStack
	self assert: aStack pop = cuartaPalabra .
	self assert: aStack pop = terceraPalabra .
	self assert: aStack pop = segundaPalabra .
	self assert: aStack pop = primerPalabra .! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'FH 5/16/2022 17:26:54'!
assertThatABlockFailsWithAPrefixError: aBlock 
	self
		should: aBlock
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefijoErrorDescription].! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'Te 5/15/2022 21:38:46'!
createAnStackWithFourElements
	|stack|
	stack := OOStack new.
	    stack push: primerPalabra.
	    stack push: segundaPalabra.
	    stack push: terceraPalabra.
	    stack push: cuartaPalabra.	
	^stack! !

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'Te 5/15/2022 21:48:53'!
setUp
	primerPalabra := 'anana'.
	segundaPalabra := 'buenas Noches'.
	terceraPalabra := 'manzana'.
	cuartaPalabra := 'mandarina'.
	stackWithFourElements := self createAnStackWithFourElements.
	stackWithNoElements := OOStack new.! !


!classDefinition: #EstadoDeLaPila category: 'Stack-Exercise'!
Object subclass: #EstadoDeLaPila
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EstadoDeLaPila methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:08'!
returnWhichPushToUseIn:pila withAString:aString

	self subclassResponsibility.! !

!EstadoDeLaPila methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:12'!
returnWhichTopToUseIn:pila

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeLaPila class' category: 'Stack-Exercise'!
EstadoDeLaPila class
	instanceVariableNames: ''!

!EstadoDeLaPila class methodsFor: 'instance initialization' stamp: 'FH 5/16/2022 17:27:49'!
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

!NoVacioConEspacio methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:17'!
returnWhichPushToUseIn:pila withAString:aString

	^pila pushWhenStackHasSpaceWithAString:aString.! !

!NoVacioConEspacio methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:21'!
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

!NoVacioSinEspacio methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:25'!
returnWhichPushToUseIn:pila withAString:aString

	^pila pushWhenStackIsFull .! !

!NoVacioSinEspacio methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:29'!
returnWhichTopToUseIn:pila

	^pila topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoVacioSinEspacio class' category: 'Stack-Exercise'!
NoVacioSinEspacio class
	instanceVariableNames: ''!

!NoVacioSinEspacio class methodsFor: 'testing' stamp: 'FH 5/16/2022 17:27:25'!
includes: anStack

	^ anStack isEmpty not and:[anStack withSpace not].! !


!classDefinition: #Vacio category: 'Stack-Exercise'!
EstadoDeLaPila subclass: #Vacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Vacio methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:34'!
returnWhichPushToUseIn:pila withAString:aString

	^pila pushWhenStackHasSpaceWithAString:aString.! !

!Vacio methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:28:37'!
returnWhichTopToUseIn:pila

	^pila topWhenEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vacio class' category: 'Stack-Exercise'!
Vacio class
	instanceVariableNames: ''!

!Vacio class methodsFor: 'testing' stamp: 'FH 5/16/2022 17:27:43'!
includes: anStack

	^anStack isEmpty.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contenido estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'FH 5/16/2022 17:28:44'!
isEmpty

	^contenido isEmpty.! !


!OOStack methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:29:11'!
size

	^contenido size.! !

!OOStack methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:29:06'!
top 

	^estado returnWhichTopToUseIn: self.! !


!OOStack methodsFor: 'popAndPush' stamp: 'FH 5/16/2022 17:28:52'!
pop

	|ultimo|
	
	ultimo := self top.
	contenido removeLast.
	estado:= EstadoDeLaPila with: self.
	^ultimo.  ! !

!OOStack methodsFor: 'popAndPush' stamp: 'FH 5/16/2022 17:28:58'!
push: aString 

	^estado returnWhichPushToUseIn: self withAString:aString.! !

!OOStack methodsFor: 'popAndPush' stamp: 'FH 5/16/2022 17:29:01'!
pushWhenStackHasSpaceWithAString:aString

	contenido add: aString. 
	estado:= EstadoDeLaPila with: self.! !


!OOStack methodsFor: 'initialization' stamp: 'Te 5/15/2022 20:11:05'!
initialize

	contenido := OrderedCollection new.
	estado := EstadoDeLaPila with: self.! !


!OOStack methodsFor: 'private' stamp: 'FH 5/16/2022 17:29:20'!
topWhenEmpty

	self error: OOStack stackEmptyErrorDescription
	! !

!OOStack methodsFor: 'private' stamp: 'FH 5/16/2022 17:29:24'!
topWhenNotEmpty

	^contenido at: self size
	! !

!OOStack methodsFor: 'private' stamp: 'FH 5/16/2022 17:29:28'!
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

!OOStackLimitada methodsFor: 'private' stamp: 'FH 5/16/2022 17:29:41'!
aLimitIsValid: unLimite

	(((unLimite isInteger) not))ifTrue:
		[self error: OOStackLimitada  limitMustBeAnIntegerErrorDescription].
	(unLimite <0)ifTrue:
		[self error: OOStackLimitada  limitMustBeAnIntegerErrorDescription].! !

!OOStackLimitada methodsFor: 'private' stamp: 'FH 5/16/2022 17:30:58'!
pushWhenStackIsFull

	self error: OOStackLimitada stackFullErrorDescription.! !

!OOStackLimitada methodsFor: 'private' stamp: 'FH 5/16/2022 17:29:46'!
withSpace

	^ self size < limite.! !


!OOStackLimitada methodsFor: 'initialization' stamp: 'FH 5/16/2022 17:29:50'!
initializeWithALimit: unLimite

	contenido := OrderedCollection new.
	estado := EstadoDeLaPila with: self.
	self aLimitIsValid: unLimite.
	limite := unLimite.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimitada class' category: 'Stack-Exercise'!
OOStackLimitada class
	instanceVariableNames: ''!

!OOStackLimitada class methodsFor: 'error descriptions' stamp: 'FH 5/16/2022 17:31:09'!
limitMustBeAnIntegerErrorDescription

	 ^ 'Limit must be a positive integer'! !

!OOStackLimitada class methodsFor: 'error descriptions' stamp: 'FH 5/16/2022 17:31:13'!
stackFullErrorDescription

	 ^ 'Stack is full'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'pila'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'FH 5/16/2022 17:33:27'!
devolverOOStack

	^pila! !


!SentenceFinderByPrefix methodsFor: 'find' stamp: 'FH 5/16/2022 17:22:18'!
find: aPrefix

	"Dado un prefijo se encarga de devolver todas las oraciones almacenadas en la pila que contengan dicho prefijo."
	
	|palabrasConElPrefix|
	self aPrefixIsValid:aPrefix.
	 palabrasConElPrefix := self findSentencesWithPrefix:aPrefix.
	^palabrasConElPrefix.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'FH 5/16/2022 17:33:36'!
initializeWith: anOOStack

	pila := anOOStack.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'Te 5/15/2022 20:49:31'!
aPrefixIsValid:aPrefix
	
	((aPrefix = '') or:(aPrefix includes: $ ))ifTrue:
		[self error: SentenceFinderByPrefix PrefijoErrorDescription].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FH 5/16/2022 17:22:18'!
findSentencesWithPrefix:aPrefix

	|palabrasConElPrefix pilaAux|
	palabrasConElPrefix := OrderedCollection new.
	pilaAux := OOStack new.
		pila size timesRepeat: [
		pilaAux push: (pila pop).
		(pilaAux top beginsWith: aPrefix) ifTrue: 
			[palabrasConElPrefix add: (pilaAux top)]].
	self reconstructStack: pilaAux .
	
	^palabrasConElPrefix.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FH 5/16/2022 17:33:41'!
reconstructStack:anStack

	anStack size timesRepeat: [pila push: (anStack pop)]
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance initialization' stamp: 'FH 5/16/2022 17:33:55'!
with: anOOStack

	^self new initializeWith: anOOStack.! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FH 5/16/2022 17:33:50'!
PrefijoErrorDescription

	^ 'Prefijo no puede tener espacio ni estar vacio'.! !
