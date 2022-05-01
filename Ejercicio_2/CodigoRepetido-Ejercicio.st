!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 5/1/2022 11:56:38'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	customerBook := CustomerBook new.
	self testOfTheExecutingTimeOf: [customerBook addCustomerNamed: 'John Lennon'] forLessThanMiliseconds: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Te 5/1/2022 13:01:32'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	
	paulMcCartney  := 'Paul McCartney'.
	customerBook := self createACustomerBookAndAddAName: paulMcCartney .
	
	self testOfTheExecutingTimeOf: [customerBook removeCustomerNamed: paulMcCartney.] forLessThanMiliseconds: 100
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 5/1/2022 11:47:20'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self assertThatABlock: [customerBook addCustomerNamed: '']
	FailsWithACertainError: Error
	andDo: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Te 5/1/2022 13:02:14'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
			
	johnLennon := 'John Lennon'.
	customerBook:= self createACustomerBookAndAddAName: johnLennon .
	
	self assertThatABlock: [customerBook removeCustomerNamed: 'Paul McCartney']
	FailsWithACertainError: NotFound
	andDo: [ :anError | self assertCustomerBook: customerBook containsOnlyOneName: johnLennon].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 5/1/2022 11:54:49'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendTheSameName:paulMcCartney inABook:customerBook.
	
	self assertThatActiveIsZeroAndSuspendedAndTotalNumberOfCustomersIs: 1 InABook:customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 5/1/2022 11:54:49'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendTheSameName:paulMcCartney inABook:customerBook.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatActiveIsZeroAndSuspendedAndTotalNumberOfCustomersIs: 0 InABook:customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Te 5/1/2022 13:04:52'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |

	johnLennon := 'John Lennon'.
	customerBook:= self createACustomerBookAndAddAName: johnLennon.

	self assertThatABlock: [customerBook suspendCustomerNamed: 'Ringo Starr'] 
	FailsWithACertainError: CantSuspend
	andDo: [ :anError | self assertCustomerBook: customerBook containsOnlyOneName: johnLennon ].

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Te 5/1/2022 13:40:30'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self addAndSuspendTheSameName:johnLennon inABook:customerBook.
	
	self assertThatABlock: [customerBook suspendCustomerNamed: johnLennon] 
	FailsWithACertainError: CantSuspend
	andDo: [ :anError | self assertCustomerBook: customerBook containsOnlyOneName: johnLennon ].

! !


!CustomerBookTest methodsFor: 'auxiliary testing' stamp: 'FH 4/30/2022 19:17:10'!
addAndSuspendTheSameName:aName inABook:customerBook
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.! !

!CustomerBookTest methodsFor: 'auxiliary testing' stamp: 'FH 5/1/2022 11:50:20'!
assertCustomerBook: aCustomerBook containsOnlyOneName: aName
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aName)! !

!CustomerBookTest methodsFor: 'auxiliary testing' stamp: 'FH 4/30/2022 20:49:21'!
assertThatABlock: aBlock FailsWithACertainError: aCertainError andDo: anotherBlock
	[ aBlock value. 	self fail ]
		on: aCertainError 
		do: anotherBlock ! !

!CustomerBookTest methodsFor: 'auxiliary testing' stamp: 'FH 5/1/2022 11:54:49'!
assertThatActiveIsZeroAndSuspendedAndTotalNumberOfCustomersIs: aNumber InABook:customerBook
    self assert: 0 equals: customerBook numberOfActiveCustomers.
    self assert: aNumber equals: customerBook numberOfSuspendedCustomers.
    self assert: aNumber equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'auxiliary testing' stamp: 'Te 5/1/2022 12:59:32'!
createACustomerBookAndAddAName:aName
	| customerBook|
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aName.
	^customerBook.! !

!CustomerBookTest methodsFor: 'auxiliary testing' stamp: 'FH 5/1/2022 11:56:38'!
testOfTheExecutingTimeOf: aBlock forLessThanMiliseconds: aMiliseconds
	|millisecondsBeforeRunning millisecondsAfterRunning |		
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aMiliseconds * millisecond)
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FH 4/30/2022 16:45:03'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FH 4/30/2022 16:52:07'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FH 4/30/2022 16:59:25'!
removeCustomerNamed: aName 
	active remove: aName 
		ifAbsent: [suspended remove: aName 
			ifAbsent:	[^ NotFound signal]]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FH 5/1/2022 12:12:22'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent:[^CantSuspend signal].

	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
