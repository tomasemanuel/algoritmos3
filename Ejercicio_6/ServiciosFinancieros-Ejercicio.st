!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
<<<<<<< HEAD
	instanceVariableNames: 'emptyPortfolio account1 portfolioWithAccount1 portfolioWithAccount1AndAccount2 account2 portfolioThatContainsAccount2AndPortfolioWithAccount1'
=======
	instanceVariableNames: 'portfolioVacio account1 portfolioWithAccount1 portfolioWithAccount1AndAccount2 account2 portfolioWithAccount2AndPortfolioWithAccount1'
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 13:55:24'!
test01AssertThatANewPortfolioHasZeroBalance
	
	self assert: 0*peso equals: emptyPortfolio balance.
	! !

!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 13:56:34'!
test02AssertThatAPortfolioWithOneAccountHasTheBalanceFromThatAccount
	
	Deposit register: 10*peso on: account1.
	self assert: 10*peso equals: portfolioWithAccount1 balance.
	! !

!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 13:57:26'!
test03AssertThatAPortfolioRegistersADepositMadeFromAnAccount
	
=======
!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 22:12:51'!
test01ANewPortfolioGivesABalanceOfZero
	
	self assert: 0*peso equals: portfolioVacio giveBalance.
	! !

!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 13:34:55'!
test02APortfolioWithOneAccountGivesCorrectlyThePortfolioBalance
	
	Deposit register: 10*peso on: account1.
	self assert: 10*peso equals: portfolioWithAccount1 giveBalance.
	! !

!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 13:35:45'!
test03APortfolioCanRegisterADepositMadeFromAnAccount
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	| deposit |
	
	deposit _ Deposit register: 10*peso on: account1.
	self assert: (portfolioWithAccount1 hasRegistered: deposit)
	! !

<<<<<<< HEAD
!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 13:59:12'!
test04AssertThatAPortfolioWithTwoAccountsHasTheBalanceFromBothAccounts
	
	Deposit register: 10*peso on: account1.
	Deposit register: 20*peso on: account2.
	self assert: 30*peso equals:(portfolioWithAccount1AndAccount2 balance)
	! !

!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 14:10:13'!
test05AssertThatAPortfolioHasAllTransactionsFromAccounts
	
	| deposit1 deposit2 AllTransactions setWithTwoDeposits |
	
	deposit1 _ Deposit register: 10*peso on: account1.
	deposit2 _ Deposit register: 20*peso on: account2.
	AllTransactions _  portfolioWithAccount1AndAccount2 transactions.
	setWithTwoDeposits _ Set with:deposit1 with:deposit2 . 
	self assert: AllTransactions equals: setWithTwoDeposits.! !

!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 14:03:25'!
test06AssertThatAPortfolioHasTheBalanceFromAccountsRecursively

	Deposit register: 20*peso on: account2.
	Deposit register: 10*peso on: account1.   
	self assert: 30 *peso equals: (portfolioThatContainsAccount2AndPortfolioWithAccount1 balance).
	! !

!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 14:10:22'!
test07AssertThatAPortfolioRegistersATransactionFromAnAccountRecursively
	
	| deposit |
	
	deposit _ Deposit register: 10*peso on: account1.
	self assert: (portfolioThatContainsAccount2AndPortfolioWithAccount1 hasRegistered:deposit).
	! !

!PortfolioTest methodsFor: 'test' stamp: 'FH 6/9/2022 14:10:29'!
test08AssertThatAPortfolioHasAllTransactionsFromAccountsRecursively
	
	| deposit1 deposit2 AllTransactions setWithTwoDeposits |
	
	deposit1 _ Deposit register: 10*peso on: account1.
	deposit2 _ Deposit register: 20*peso on: account2.
	AllTransactions _  portfolioThatContainsAccount2AndPortfolioWithAccount1 transactions.
=======
!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 13:36:02'!
test04APortfolioWithTwoAccountsCanCalculateCorrectlyItsBalance
	
	
	Deposit register: 10*peso on: account1.
	Deposit register: 20*peso on: account2.
	self assert: 30*peso equals:(portfolioWithAccount1AndAccount2 giveBalance)
	! !

!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 15:07:56'!
test06APortfolioCanGiveABalanceRecursively
	
	

	Deposit register: 20*peso on: account2.
	Deposit register: 10*peso on: account1.   
	self assert: 30 *peso equals: (portfolioWithAccount2AndPortfolioWithAccount1 giveBalance).
	! !

!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 22:11:53'!
test07APortfolioCanLookForATransactionRecursively
	| deposit |
	
	deposit _ Deposit register: 10*peso on: account1.
	self assert: (portfolioWithAccount2AndPortfolioWithAccount1 hasRegistered:deposit).
	! !

!PortfolioTest methodsFor: 'test' stamp: 'Te 6/7/2022 14:58:53'!
test08
	| deposit1 deposit2 AllTransactions setWithTwoDeposits |
	deposit1 _ Deposit register: 10*peso on: account1.
	deposit2 _ Deposit register: 20*peso on: account2.
	AllTransactions _  portfolioWithAccount2AndPortfolioWithAccount1 transactions.
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	setWithTwoDeposits _ Set with:deposit1 with:deposit2 . 
	self assert: AllTransactions equals: setWithTwoDeposits.! !


<<<<<<< HEAD
!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:09:34'!
test09AssertAPortfolioCantAddAnExistingAcountTwice

	self assertThatABlock:[ portfolioWithAccount1 add: account1]
	      FailsWithAPortfolioError: Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription.
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:11:00'!
test10AssertAPortfolioCantAddAnAccountThatExistsOnAPorfolioInsideIt

	|portfolio |

	portfolio _ Portfolio new.
	portfolio add: portfolioWithAccount1 .
	self assertThatABlock: [ portfolio add: account1]
	      FailsWithAPortfolioError:  Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription.

	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:16:00'!
test11AssertAPortfolioCantAddAnAccountThatExistsOnAPorfolioInsideItRecursively
	
	|portfolio portfolio2|
	
=======
!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:28:57'!
test10assertAPortfolioCantAddAnExistingAcountTwice

	self assertThatABlock:[ portfolioWithAccount1 add: account1. ]  FailsWithAPortfolioError: Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription.
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:28:27'!
test11assertAPortfolioCantAddAnAccountThatExistsOnAPorfolioInsideIt
	|portfolio |
	portfolio _ Portfolio new.
	portfolio add: portfolioWithAccount1 .
	self assertThatABlock: [ portfolio add: account1. ]  FailsWithAPortfolioError:  Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription.

	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:28:06'!
test12assertAPortfolioCantAddAnAccountThatExistsOnAPorfolioInsideItRecursively
	|portfolio portfolio2 |
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio2 add:portfolioWithAccount1 .
	portfolio add: portfolio2.
<<<<<<< HEAD
	self assertThatABlock: [ portfolio add: account1]
	      FailsWithAPortfolioError: Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription.

	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:16:08'!
test12AssertAPortfolioCantAddItself

	self assertThatABlock: [ emptyPortfolio add: emptyPortfolio]
	      FailsWithAPortfolioError: Portfolio PortfolioCantAddItselfErrorDescription.
	
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:16:20'!
test13AssertAPortfolioCantAddAnAccountifItsPortfolioFatherHasTheAccount

	portfolioWithAccount1 add: emptyPortfolio .
	self assertThatABlock:[ emptyPortfolio add: account1]
	      FailsWithAPortfolioError: Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription.
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:16:28'!
test14AssertAPortfolioCantAddAnAccountIfAPortfolioFatherHasTheAccount

	|portfolio|

	portfolio _ Portfolio new.
	portfolio add: account2.
	portfolio add: emptyPortfolio.
	portfolioWithAccount1 add:portfolio.
	self assertThatABlock:[ emptyPortfolio add: account1]
	      FailsWithAPortfolioError: Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription.
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:16:40'!
test15AssertAPortfolioCantAddAnotherPortfolioThatContainsAnAlreadyRegisteredAccount

	|portfolio|

	portfolio _ Portfolio new.
	portfolio add: account1.
	self assertThatABlock: [ portfolioWithAccount1 add: portfolio]
	      FailsWithAPortfolioError: Portfolio PortfolioCantAddAPortofolioThatContainsAnExistingAccountErrorDescription.! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'FH 6/9/2022 14:51:03'!
test16AssertAPortfolioWithTwoFathersChecksIfAnyOfItsFatherHasTheAccount

    | portfolio1 portfolio2 |

    portfolio1 _ Portfolio new.
    portfolio2 _ Portfolio new.
    portfolio1 add: portfolio2.
    portfolio1 add:account2.
    portfolioWithAccount1 add:portfolio2.

    self assertThatABlock: [ portfolio2 add: account1. ] FailsWithAPortfolioError: Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription .! !


!PortfolioTest methodsFor: 'setUp' stamp: 'FH 6/9/2022 13:31:11'!
setUp
	emptyPortfolio _ Portfolio new.
=======
	self assertThatABlock: [ portfolio add: account1. ]  FailsWithAPortfolioError:  Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription.

	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:27:14'!
test13assertAPortfolioCantAddItself

	self assertThatABlock: [ portfolioVacio add: portfolioVacio . ] FailsWithAPortfolioError:  Portfolio PortfolioCantAddItselfErrorDescription.
	
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:26:42'!
test14assertAPortfolioCantAddAnAccountifItsPortfolioFatherHasTheAccount

	portfolioWithAccount1 add: portfolioVacio .
	self assertThatABlock:[ portfolioVacio add: account1 . ]  FailsWithAPortfolioError: Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription.
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:26:55'!
test15assertAPortfolioCantAddAnAccountIfAPortfolioFatherHasTheAccount
	|portfolio1 |
	portfolio1 _ Portfolio new.
	portfolio1 add: account2.
	portfolio1 add: portfolioVacio .
	portfolioWithAccount1 add:portfolio1.
	self assertThatABlock:[ portfolioVacio add: account1 . ]  FailsWithAPortfolioError: Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription.
	! !

!PortfolioTest methodsFor: 'testExtra' stamp: 'Te 6/7/2022 23:24:18'!
test16assertAPortfolioCantAddAnotherPortfolioThatContainsAnAlreadyRegisteredAccount
	| portfolio2 |
	portfolio2 _ Portfolio new.
	portfolio2 add: account1.
	self assertThatABlock: [ portfolioWithAccount1 add:portfolio2 . ] FailsWithAPortfolioError: Portfolio PortfolioCantAddAPortofolioThatContainsAnExistingAccountErrorDescription.! !


!PortfolioTest methodsFor: 'setUp' stamp: 'Te 6/7/2022 13:34:36'!
setUp
	portfolioVacio _ Portfolio new.
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	
	portfolioWithAccount1 _ Portfolio new.
	account1 _ ReceptiveAccount new.
	portfolioWithAccount1 add:account1.
	
	portfolioWithAccount1AndAccount2 _ Portfolio  new.
	account2 _ ReceptiveAccount new.
	portfolioWithAccount1AndAccount2 add: account1.
	portfolioWithAccount1AndAccount2 add: account2.
	
<<<<<<< HEAD
	portfolioThatContainsAccount2AndPortfolioWithAccount1 _ Portfolio new.
	portfolioThatContainsAccount2AndPortfolioWithAccount1 add: account2.
	portfolioThatContainsAccount2AndPortfolioWithAccount1 add: portfolioWithAccount1.! !


!PortfolioTest methodsFor: 'private' stamp: 'Te 6/7/2022 22:24:30'!
=======
	portfolioWithAccount2AndPortfolioWithAccount1 _ Portfolio new.
	portfolioWithAccount2AndPortfolioWithAccount1 add: account2.
	portfolioWithAccount2AndPortfolioWithAccount1 add: portfolioWithAccount1.! !


!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:24:30'!
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
assertThatABlock: aBlock FailsWithAPortfolioError: aPortfolioError
	self
		should: aBlock
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText =aPortfolioError ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'xd 6/6/2022 21:10:04'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'xd 6/6/2022 21:10:04'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'xd 6/6/2022 21:10:04'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

<<<<<<< HEAD
!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FH 6/9/2022 08:58:19'!
=======
!ReceptiveAccountTest methodsFor: 'tests' stamp: 'xd 6/6/2022 20:30:45'!
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
<<<<<<< HEAD
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) transactionValue.
=======
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) transferValue
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceBetweenAccountsTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceBetweenAccountsTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:35:53'!
test01TransferWithAValueChangesCorrectlyBalanceInBothAccounts

=======
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test01TransferWithAValueChangesCorrectlyBalanceInBothAccounts


>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	self transferenceBetweenTwoAccountsForAValue:10*peso.
	
	self assert: 0*peso equals: account1 balance.
	self assert: 10*peso equals: account2 balance.! !

<<<<<<< HEAD
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:35:58'!
test02TransferCanRegisterDepositOrWithdrawInInRespectiveAccount

=======
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test02TransferCanRegisterDepositOrWithdrawInInRespectiveAccount
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	| transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue:10*peso.
	self assert: (account1 hasRegistered: (transference withdraw)).
	self assert: (account2 hasRegistered: (transference deposit)).! !

<<<<<<< HEAD
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:36:17'!
test03TransferValueIsRegisteredCorrectly
	
	|transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 20*peso.
	self assert: ( transference isTransferValueEqualToAValue: 20*peso).
! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:36:20'!
test04AssertThatEachLegCanRecognizeItsCounterpart

=======
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test03TransferValueIsRegisteredCorrectly
	|transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 20*peso.
	self assert: ( transference transferValueIsEqualToAValue: 20*peso).
! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test04EachLegCanRecognizeItsCounterpartCorrectly
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	| transference withdrawLeg depositLeg|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 10*peso.
	withdrawLeg _ transference withdrawLeg.
	depositLeg _ transference depositLeg.
	 
	self assert: ( withdrawLeg itsCounterpartIs: depositLeg).
	self assert: ( depositLeg itsCounterpartIs: withdrawLeg).
! !

<<<<<<< HEAD
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 14:19:31'!
test05AssertThatATransferCannotBeMadeWithANegativeValue
	
	self assertThatABlock: [ account1 transfer: (-10)*peso to: account2] 
	      FailsWithATransferenceError: Transference transferenceValueCannotBeZeroOrNegativeErrorDescription.
! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 14:19:32'!
test06AssertThatATransferCannotBeMadeWithZeroValue

	self assertThatABlock: [ account1 transfer: 0*peso to: account2] 
	      FailsWithATransferenceError: Transference transferenceValueCannotBeZeroOrNegativeErrorDescription.! !


!TransferenceBetweenAccountsTest methodsFor: 'private' stamp: 'FH 6/9/2022 13:37:28'!
assertThatABlock: aBlock FailsWithATransferenceError: aTransferenceError
	self
		should: aBlock
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText =aTransferenceError ].! !

!TransferenceBetweenAccountsTest methodsFor: 'private' stamp: 'Te 6/7/2022 13:26:13'!
=======
!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:59:04'!
test05AssertThatATransferCannotBeMadeWithANegativeValue
	self
		should: [ account1 transfer: (-10)*peso to: account2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = ReceptiveAccount  ValueCannotBeZeroOrNegativeErrorDescription ].! !


!TransferenceBetweenAccountsTest methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 13:24:24'!
setUp
	account1  _ ReceptiveAccount new.
	account2 _ ReceptiveAccount  new.! !

!TransferenceBetweenAccountsTest methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 13:26:13'!
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
transferenceBetweenTwoAccountsForAValue:aValue
	| transference|
	Deposit register: aValue on: account1.
	transference _ account1 transfer: aValue to: account2.
	^transference.	! !

<<<<<<< HEAD

!TransferenceBetweenAccountsTest methodsFor: 'setUp' stamp: 'Te 6/7/2022 13:24:24'!
setUp
	account1  _ ReceptiveAccount new.
	account2 _ ReceptiveAccount  new.! !

=======
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61

!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!AccountTransaction methodsFor: 'value' stamp: 'FH 6/9/2022 12:19:59'!
transactionValue
	^ value.! !
=======
!AccountTransaction methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue 
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61


!AccountTransaction methodsFor: 'initialization' stamp: 'FH 6/9/2022 12:19:59'!
initializeFor: aValue

	value := aValue. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'xd 6/6/2022 20:11:12'!
register: aValue on: account

	| transaction |
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!Deposit methodsFor: 'private' stamp: 'FH 6/9/2022 12:22:33'!
addTransactionBalanceTo: aBalance
	^aBalance + self transactionValue.! !
=======
!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:30:45'!
conBalance: aBalance
	^aBalance + self transferValue.! !
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!Withdraw methodsFor: 'private' stamp: 'FH 6/9/2022 12:22:33'!
addTransactionBalanceTo: aBalance
	^aBalance - self transactionValue.! !
=======
!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue

	^ value.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:30:45'!
conBalance: aBalance
	^aBalance - self transferValue.! !
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


<<<<<<< HEAD
!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts fathers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'FH 6/9/2022 14:36:58'!
add: aNewMember 
	self isAddingANewMemberValid: aNewMember.	
	accounts add:aNewMember.
	aNewMember isFatherOf: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'FH 6/9/2022 13:27:56'!
balance
	^accounts inject: 0 into: [:aBalance : aMember | aMember addBalance: aBalance].! !

!Portfolio methodsFor: 'main protocol' stamp: 'Te 6/7/2022 22:53:08'!
hasRegistered: aTransaction
	^accounts anySatisfy:[:aMember | aMember hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'main protocol' stamp: 'Te 6/7/2022 22:53:08'!
transactions
	|allTransactions|
	allTransactions _ Set new.
	accounts do: [:aMember | allTransactions addAll: aMember transactions].
	^allTransactions.! !


!Portfolio methodsFor: 'private' stamp: 'FH 6/9/2022 13:27:57'!
addBalance:aBalance
	^self balance + aBalance.! !

!Portfolio methodsFor: 'private' stamp: 'FH 6/9/2022 14:45:11'!
findPortfolioRoots
	|roots|
	
	roots _ Set new.
	(fathers isEmpty)ifTrue:[roots add: self].
	fathers do: [:aFather| roots addAll: aFather findPortfolioRoots].
	^roots. ! !

!Portfolio methodsFor: 'private' stamp: 'Te 6/7/2022 23:06:42'!
has:aNewMember
	^accounts anySatisfy:[:aMember | aMember has:aNewMember].
	! !

!Portfolio methodsFor: 'private' stamp: 'Te 6/7/2022 22:53:08'!
hasAtLeastOneMemberInCommonWithAPortfolio:aPortfolio
	^accounts anySatisfy:[:aMember | aPortfolio has:aMember].! !

!Portfolio methodsFor: 'private' stamp: 'FH 6/9/2022 14:46:54'!
isAddingANewMemberValid: aNewMember
	| roots |
	
	(self has:aNewMember)ifTrue:
		[self error: Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription ].
	(self = aNewMember )ifTrue:
		[self error: Portfolio PortfolioCantAddItselfErrorDescription].
	roots _ self findPortfolioRoots.
	roots do:[:root| root verifiesIfMembersDontHaveANewAccount:aNewMember].
	(aNewMember hasAtLeastOneMemberInCommonWithAPortfolio: self) ifTrue:
		[self error: Portfolio PortfolioCantAddAPortofolioThatContainsAnExistingAccountErrorDescription].! !

!Portfolio methodsFor: 'private' stamp: 'FH 6/9/2022 14:37:12'!
isFatherOf:aPortfolio
	fathers add: aPortfolio.! !

!Portfolio methodsFor: 'private' stamp: 'FH 6/9/2022 13:17:25'!
verifiesIfMembersDontHaveANewAccount:aNewMember
	(self has:aNewMember)ifTrue:
		[self error:  Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription].! !


!Portfolio methodsFor: 'initialization' stamp: 'FH 6/9/2022 14:35:20'!
initialize
	accounts _ Set new.
	fathers _ OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errorDescriptions' stamp: 'FH 6/9/2022 14:18:26'!
PortfolioCantAddAPortofolioThatContainsAnExistingAccountErrorDescription
	^'Portfolio cant add another Portofolio which contains an account that exists on itself'.
	! !

!Portfolio class methodsFor: 'errorDescriptions' stamp: 'Te 6/7/2022 14:23:14'!
PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription
	^'Portfolio cant add an account that exists on the portfolio father of itself'.! !

!Portfolio class methodsFor: 'errorDescriptions' stamp: 'FH 6/9/2022 14:17:56'!
PortfolioCantAddAnExistingMemberTwiceErrorDescription
	^'Portfolio cant add the same account twice'.! !

!Portfolio class methodsFor: 'errorDescriptions' stamp: 'FH 6/9/2022 14:17:35'!
PortfolioCantAddItselfErrorDescription
	^'Portfolio cant add itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'FH 6/9/2022 13:04:05'!
initialize

	transactions _ OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/9/2022 13:13:06'!
balance
	^transactions inject: 0 into: [:aBalance :aTransaction | aTransaction addTransactionBalanceTo: aBalance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/8/2022 19:28:48'!
hasRegistered: aTransaction
	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/8/2022 19:28:59'!
register: aTransaction
	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/8/2022 19:29:04'!
transactions 
	^ transactions copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/9/2022 13:52:44'!
transfer: aValue to: aReceptiveAccount
	^Transference register: aValue from: self to: aReceptiveAccount. ! !


!ReceptiveAccount methodsFor: 'private' stamp: 'FH 6/9/2022 12:48:04'!
addBalance: aBalance 
     ^self balance + aBalance.
	
	! !
=======
!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #DepositLeg
	instanceVariableNames: 'deposit counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61

!ReceptiveAccount methodsFor: 'private' stamp: 'Te 6/7/2022 13:08:21'!
has: aReceptiveAccount
	^self = aReceptiveAccount .! !

!ReceptiveAccount methodsFor: 'private' stamp: 'Te 6/7/2022 15:17:35'!
hasAtLeastOneMemberInCommonWithAPortfolio:APortfolio
	^false
	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'FH 6/9/2022 14:36:58'!
isFatherOf:Portfolio

<<<<<<< HEAD
	! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'withdrawLeg depositLeg transferValue'
=======
!DepositLeg methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:13:32'!
deposit
	^deposit! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:44:08'!
itsCounterpartIs: aWithdrawLeg 
	^(counterpart = aWithdrawLeg). ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'FH 6/5/2022 20:05:39'!
register: aValue on: aReceptiveAccount 

	^self new initializeRegister: aValue on: aReceptiveAccount ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts padre'
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!Transference methodsFor: 'initialization' stamp: 'FH 6/9/2022 09:02:40'!
initializeWithAWithdraw: aWithdraw withADeposit: aDeposit forAValue:aValue
=======
!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 23:14:18'!
add: aNewMember 
	| raiz |
	
	(self has:aNewMember)ifTrue:[self error: Portfolio PortfolioCantAddAnExistingMemberTwiceErrorDescription ].
	(self = aNewMember )ifTrue:[self error: Portfolio PortfolioCantAddItselfErrorDescription].
	raiz _ self encontrarRaiz.
	raiz verifiesIfMembersDontHaveANewAccount:aNewMember.
	
	(aNewMember hasAtLeastOneMemberInCommonWithAPortfolio: self) ifTrue:[self error: Portfolio PortfolioCantAddAPortofolioThatContainsAnExistingAccountErrorDescription].
	
	accounts add:aNewMember.
	aNewMember padre: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 21:41:39'!
addBalance:aBalance
	^self giveBalance + aBalance.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 23:06:01'!
encontrarRaiz
	^(self hasFather )ifTrue:[(self padre) encontrarRaiz]ifFalse:[
	self].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:53:08'!
giveBalance
	^accounts inject: 0 into: [:aBalance : aMember | aMember addBalance: aBalance].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 23:06:42'!
has:aNewMember
	^accounts anySatisfy:[:aMember | aMember has:aNewMember].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:53:08'!
hasAtLeastOneMemberInCommonWithAPortfolio:aPortfolio
	^accounts anySatisfy:[:aMember | aPortfolio has:aMember].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:38:57'!
hasFather

	^padre notNil.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:53:08'!
hasRegistered: aTransaction
	^accounts anySatisfy:[:aMember | aMember hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:53:08'!
initialize
	accounts _ Set new.
	padre _ nil.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:54:17'!
padre
	^padre.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:19:45'!
padre:aPortfolio
	padre:= aPortfolio! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:53:08'!
transactions
	|allTransactions|
	allTransactions _ Set new.
	accounts do: [:aMember | allTransactions addAll: aMember transactions].
	^allTransactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 23:12:24'!
verifiesIfMembersDontHaveANewAccount:aNewMember
	(self has:aNewMember)ifTrue:[self error:  Portfolio PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:50:05'!
PortfolioCantAddAPortofolioThatContainsAnExistingAccountErrorDescription
	^'Portfolio Cant Add Another Portofolio Which contains an account that exists on itself'.
	! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:23:14'!
PortfolioCantAddAnAccountThatExistsInItsFatherPortfolioErrorDescription
	^'Portfolio cant add an account that exists on the portfolio father of itself'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:06:07'!
PortfolioCantAddAnExistingMemberTwiceErrorDescription
	^'Portfolio Cant Add The Same Account Twice To Itself'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:49:17'!
PortfolioCantAddItselfErrorDescription
	^'Portfolio Cant Add Itself'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'xd 6/6/2022 21:09:07'!
balance

	^transactions inject: 0 into: [:aBalance :aTransaction | aTransaction conBalance: aBalance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/5/2022 19:03:19'!
hasRegistered: aTransaction
	"(aTransaction isKindOf: Transference)IfTrue: aTrans"
	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 21:41:39'!
addBalance: aBalance 
     ^aBalance + self balance.
	
	! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 13:08:21'!
has: aReceptiveAccount
	^self = aReceptiveAccount .! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 15:17:35'!
hasAtLeastOneMemberInCommonWithAPortfolio:APortfolio
	^false
	! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 14:19:15'!
padre:Portfolio

	! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 13:59:04'!
transfer: aValue to: aReceptiveAccount

	"Withdraw register: aSimpleMeasure on: self.
	Deposit register: aSimpleMeasure on: aReceptiveAccount."
	(self valueIsNegativeOrZero:aValue)ifTrue:[self error: ReceptiveAccount ValueCannotBeZeroOrNegativeErrorDescription].
	^Transference register: aValue from: self to: aReceptiveAccount. ! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:17:35'!
valueIsNegativeOrZero:aValue
	^(aValue <=0).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 13:59:04'!
ValueCannotBeZeroOrNegativeErrorDescription
	^'La Cuenta No Puede Transferir Un Valor Negativo O Cero'.! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'withdrawLeg depositLeg valueOfTransference transferValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'xd 6/6/2022 20:27:53'!
initializeWith: aWithdraw and: aDeposit and:aValue
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	transferValue _ aValue.
	withdrawLeg _ aWithdraw.
	depositLeg _ aDeposit. 
! !


<<<<<<< HEAD
!Transference methodsFor: 'comparing' stamp: 'FH 6/9/2022 13:21:52'!
isTransferValueEqualToAValue:aValue
=======
!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:41:55'!
deposit
	^depositLeg deposit.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:42:43'!
depositLeg
	^depositLeg! !

!Transference methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:30:45'!
transferValue
	^ transferValue .! !

!Transference methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:35:35'!
transferValueIsEqualToAValue:aValue
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	^ aValue = transferValue.
	
	! !

<<<<<<< HEAD

!Transference methodsFor: 'accessing' stamp: 'FH 6/9/2022 12:41:13'!
deposit
	^depositLeg transaction.! !

!Transference methodsFor: 'accessing' stamp: 'FH 6/5/2022 20:42:43'!
depositLeg
	^depositLeg! !

!Transference methodsFor: 'accessing' stamp: 'xd 6/6/2022 20:30:45'!
transferValue
	^ transferValue .! !

!Transference methodsFor: 'accessing' stamp: 'FH 6/9/2022 12:42:24'!
withdraw
	^withdrawLeg transaction.! !

!Transference methodsFor: 'accessing' stamp: 'FH 6/5/2022 20:42:31'!
=======
!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:41:40'!
withdraw
	^withdrawLeg withdraw.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:42:31'!
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
withdrawLeg
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: 'valueOfTransference'!

<<<<<<< HEAD
!Transference class methodsFor: 'instance creation' stamp: 'FH 6/9/2022 14:19:32'!
register: aValue from: aGiverAccount to: aReceiverAccount 
	|withdraw deposit|
	(aValue strictlyPositive not)ifTrue:
		[self error: 	Transference transferenceValueCannotBeZeroOrNegativeErrorDescription].
		
=======
!Transference class methodsFor: 'instance creation' stamp: 'xd 6/6/2022 20:32:46'!
register: aValue from: aGiverAccount to: aReceiverAccount 
	|withdraw deposit|
	"valueOfTransference := aValue.
	withdraw := WithdrawLeg register: self on: aGiverAccount.
	deposit _ DepositLeg register: self on: aReceiverAccount."
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	withdraw _ WithdrawLeg register: aValue on: aGiverAccount.
	deposit _ DepositLeg register: aValue on: aReceiverAccount.
	withdraw counterpart: deposit.
	deposit counterpart: withdraw.
<<<<<<< HEAD
	^self new initializeWithAWithdraw: withdraw withADeposit: deposit forAValue: aValue. ! !


!Transference class methodsFor: 'errorDescriptions' stamp: 'FH 6/9/2022 14:20:30'!
transferenceValueCannotBeZeroOrNegativeErrorDescription
	^'Transference cannot be done with zero or a negative value'.! !


!classDefinition: #TransferenceLegs category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferenceLegs
	instanceVariableNames: 'counterpart transaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceLegs methodsFor: 'private' stamp: 'FH 6/9/2022 12:32:19'!
counterpart: aCounterpart 
	counterpart _ aCounterpart. ! !


!TransferenceLegs methodsFor: 'accessing' stamp: 'FH 6/9/2022 12:34:54'!
transaction
	^transaction.! !


!TransferenceLegs methodsFor: 'comparing' stamp: 'FH 6/9/2022 12:33:52'!
itsCounterpartIs: aCounterpart 
	^(counterpart = aCounterpart). ! !


!TransferenceLegs methodsFor: 'initialization' stamp: 'FH 6/9/2022 14:22:22'!
initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount 
	self subclassResponsibility. ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLegs subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'initialization' stamp: 'FH 6/9/2022 14:22:22'!
initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount 
	transaction _ Deposit register: aValue on: aReceptiveAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'instance creation' stamp: 'FH 6/9/2022 14:22:22'!
register: aValue on: aReceptiveAccount 

	^self new initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferenceLegs subclass: #WithdrawLeg
	instanceVariableNames: ''
=======
	^self new initializeWith: withdraw and: deposit and: aValue. ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #WithdrawLeg
	instanceVariableNames: 'withdraw counterpart'
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

<<<<<<< HEAD
!WithdrawLeg methodsFor: 'initialization' stamp: 'FH 6/9/2022 14:22:22'!
initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount 
	transaction _ Withdraw register: aValue on: aReceptiveAccount.  ! !
=======
!WithdrawLeg methodsFor: 'initialization' stamp: 'FH 6/5/2022 20:05:00'!
initializeRegister: aValue on: aReceptiveAccount 
	withdraw _ Withdraw register: aValue on: aReceptiveAccount.  
	"value := aValue.
	receptiveAccount := aReceptiveAccount."! !


!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:39:14'!
counterpart: aDepositLeg 
	counterpart _ aDepositLeg. ! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:43:08'!
itsCounterpartIs: aDepositLeg 
	^(counterpart = aDepositLeg). ! !

!WithdrawLeg methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:10:09'!
withdraw
	^withdraw.! !
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

<<<<<<< HEAD
!WithdrawLeg class methodsFor: 'instance creation' stamp: 'FH 6/9/2022 14:22:22'!
register: aValue on: aReceptiveAccount 

	^self new initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount ! !
=======
!WithdrawLeg class methodsFor: 'instance creation' stamp: 'FH 6/5/2022 20:00:33'!
register: aValue on: aReceptiveAccount 

	^self new initializeRegister: aValue on: aReceptiveAccount ! !
>>>>>>> 0eb350a5c7bb8a7e3bf06760d3c3189a08dbba61
