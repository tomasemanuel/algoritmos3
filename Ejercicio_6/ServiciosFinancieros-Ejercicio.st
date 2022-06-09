!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'emptyPortfolio account1 portfolioWithAccount1 portfolioWithAccount1AndAccount2 account2 portfolioThatContainsAccount2AndPortfolioWithAccount1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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
	
	| deposit |
	
	deposit _ Deposit register: 10*peso on: account1.
	self assert: (portfolioWithAccount1 hasRegistered: deposit)
	! !

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
	setWithTwoDeposits _ Set with:deposit1 with:deposit2 . 
	self assert: AllTransactions equals: setWithTwoDeposits.! !


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
	
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio2 add:portfolioWithAccount1 .
	portfolio add: portfolio2.
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
	
	portfolioWithAccount1 _ Portfolio new.
	account1 _ ReceptiveAccount new.
	portfolioWithAccount1 add:account1.
	
	portfolioWithAccount1AndAccount2 _ Portfolio  new.
	account2 _ ReceptiveAccount new.
	portfolioWithAccount1AndAccount2 add: account1.
	portfolioWithAccount1AndAccount2 add: account2.
	
	portfolioThatContainsAccount2AndPortfolioWithAccount1 _ Portfolio new.
	portfolioThatContainsAccount2AndPortfolioWithAccount1 add: account2.
	portfolioThatContainsAccount2AndPortfolioWithAccount1 add: portfolioWithAccount1.! !


!PortfolioTest methodsFor: 'private' stamp: 'Te 6/7/2022 22:24:30'!
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FH 6/9/2022 08:58:19'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) transactionValue.
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

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:35:53'!
test01TransferWithAValueChangesCorrectlyBalanceInBothAccounts

	self transferenceBetweenTwoAccountsForAValue:10*peso.
	
	self assert: 0*peso equals: account1 balance.
	self assert: 10*peso equals: account2 balance.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:35:58'!
test02TransferCanRegisterDepositOrWithdrawInInRespectiveAccount

	| transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue:10*peso.
	self assert: (account1 hasRegistered: (transference withdraw)).
	self assert: (account2 hasRegistered: (transference deposit)).! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:36:17'!
test03TransferValueIsRegisteredCorrectly
	
	|transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 20*peso.
	self assert: ( transference isTransferValueEqualToAValue: 20*peso).
! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/9/2022 13:36:20'!
test04AssertThatEachLegCanRecognizeItsCounterpart

	| transference withdrawLeg depositLeg|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 10*peso.
	withdrawLeg _ transference withdrawLeg.
	depositLeg _ transference depositLeg.
	 
	self assert: ( withdrawLeg itsCounterpartIs: depositLeg).
	self assert: ( depositLeg itsCounterpartIs: withdrawLeg).
! !

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
transferenceBetweenTwoAccountsForAValue:aValue
	| transference|
	Deposit register: aValue on: account1.
	transference _ account1 transfer: aValue to: account2.
	^transference.	! !


!TransferenceBetweenAccountsTest methodsFor: 'setUp' stamp: 'Te 6/7/2022 13:24:24'!
setUp
	account1  _ ReceptiveAccount new.
	account2 _ ReceptiveAccount  new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'FH 6/9/2022 12:19:59'!
transactionValue
	^ value.! !


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

!Deposit methodsFor: 'private' stamp: 'FH 6/9/2022 12:22:33'!
addTransactionBalanceTo: aBalance
	^aBalance + self transactionValue.! !

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

!Withdraw methodsFor: 'private' stamp: 'FH 6/9/2022 12:22:33'!
addTransactionBalanceTo: aBalance
	^aBalance - self transactionValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


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

!ReceptiveAccount methodsFor: 'private' stamp: 'Te 6/7/2022 13:08:21'!
has: aReceptiveAccount
	^self = aReceptiveAccount .! !

!ReceptiveAccount methodsFor: 'private' stamp: 'Te 6/7/2022 15:17:35'!
hasAtLeastOneMemberInCommonWithAPortfolio:APortfolio
	^false
	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'FH 6/9/2022 14:36:58'!
isFatherOf:Portfolio

	! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'withdrawLeg depositLeg transferValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'FH 6/9/2022 09:02:40'!
initializeWithAWithdraw: aWithdraw withADeposit: aDeposit forAValue:aValue
	transferValue _ aValue.
	withdrawLeg _ aWithdraw.
	depositLeg _ aDeposit. 
! !


!Transference methodsFor: 'comparing' stamp: 'FH 6/9/2022 13:21:52'!
isTransferValueEqualToAValue:aValue
	^ aValue = transferValue.
	
	! !


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
withdrawLeg
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: 'valueOfTransference'!

!Transference class methodsFor: 'instance creation' stamp: 'FH 6/9/2022 14:19:32'!
register: aValue from: aGiverAccount to: aReceiverAccount 
	|withdraw deposit|
	(aValue strictlyPositive not)ifTrue:
		[self error: 	Transference transferenceValueCannotBeZeroOrNegativeErrorDescription].
		
	withdraw _ WithdrawLeg register: aValue on: aGiverAccount.
	deposit _ DepositLeg register: aValue on: aReceiverAccount.
	withdraw counterpart: deposit.
	deposit counterpart: withdraw.
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
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'initialization' stamp: 'FH 6/9/2022 14:22:22'!
initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount 
	transaction _ Withdraw register: aValue on: aReceptiveAccount.  ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'FH 6/9/2022 14:22:22'!
register: aValue on: aReceptiveAccount 

	^self new initializeWithAValue: aValue AndWithAnAccount: aReceptiveAccount ! !
