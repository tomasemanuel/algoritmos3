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

!CustomerBookTest methodsFor: 'xxx' stamp: 'FH 4/30/2022 19:17:10'!
addAndSuspendTheSameName:aName inABook:customerBook
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.! !

!CustomerBookTest methodsFor: 'xxx' stamp: 'FH 4/30/2022 19:47:42'!
testCertainError: aCertainError from: aBlock andDo: anotherBlock
	[ aBlock. 	self fail ]
		on: aCertainError 
		do: [:anError | anotherBlock] ! !

!CustomerBookTest methodsFor: 'xxx' stamp: 'FH 4/30/2022 20:10:27'!
testCustomerBook: aCustomerBook containsOnlyOneName: aName
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aName)! !

!CustomerBookTest methodsFor: 'xxx' stamp: 'FH 4/30/2022 18:31:35'!
testOfTheExecutingTimeOf: aBlock forLessThan: aMiliseconds
	|millisecondsBeforeRunning millisecondsAfterRunning |		
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlock.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aMiliseconds * millisecond)
! !

!CustomerBookTest methodsFor: 'xxx' stamp: 'FH 4/30/2022 19:22:20'!
testSuspendedActiveAndTotalNumberOfCustomers: aNumber InABook:customerBook
    self assert: 0 equals: customerBook numberOfActiveCustomers.
    self assert: aNumber equals: customerBook numberOfSuspendedCustomers.
    self assert: aNumber equals: customerBook numberOfCustomers.! !


!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 18:31:48'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	customerBook := CustomerBook new.
	self testOfTheExecutingTimeOf: [customerBook addCustomerNamed: 'John Lennon'] forLessThan: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 18:31:41'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	self testOfTheExecutingTimeOf: [customerBook removeCustomerNamed: paulMcCartney.] forLessThan: 100
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 20:09:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self testCustomerBook: customerBook containsOnlyOneName: johnLennon]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 19:24:50'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendTheSameName:paulMcCartney inABook:customerBook.
	
	self testSuspendedActiveAndTotalNumberOfCustomers: 1 InABook:customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 19:24:30'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendTheSameName:paulMcCartney inABook:customerBook.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self testSuspendedActiveAndTotalNumberOfCustomers: 0 InABook:customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 19:42:25'!
test07CanNotSuspendAnInvalidCustomer
	
| customerBook johnLennon |

    customerBook := CustomerBook new.
    johnLennon := 'John Lennon'.
    customerBook addCustomerNamed: johnLennon.

	self testCertainError: CantSuspend  from: [customerBook suspendCustomerNamed: 'Ringo Starr'] andDo: [self assert: customerBook numberOfCustomers = 1.
            self assert: (customerBook includesCustomerNamed: johnLennon) ].
   " [ customerBook suspendCustomerNamed: 'Ringo Starr'.
    self fail ]
        on: CantSuspend 
        do: [ :anError | 
            self assert: customerBook numberOfCustomers = 1.
            self assert: (customerBook includesCustomerNamed: johnLennon) ]"
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FH 4/30/2022 20:10:14'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self addAndSuspendTheSameName:johnLennon inABook:customerBook.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self testCustomerBook: customerBook containsOnlyOneName: johnLennon ]
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

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
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
