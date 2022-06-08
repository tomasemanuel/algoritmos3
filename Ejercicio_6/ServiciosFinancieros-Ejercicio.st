!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolioVacio account1 portfolioWithAccount1 portfolioWithAccount1AndAccount2 account2 portfolioWithAccount2AndPortfolioWithAccount1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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
	| deposit |
	
	deposit _ Deposit register: 10*peso on: account1.
	self assert: (portfolioWithAccount1 hasRegistered: deposit)
	! !

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
	setWithTwoDeposits _ Set with:deposit1 with:deposit2 . 
	self assert: AllTransactions equals: setWithTwoDeposits.! !


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
	portfolio _ Portfolio new.
	portfolio2 _ Portfolio new.
	portfolio2 add:portfolioWithAccount1 .
	portfolio add: portfolio2.
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
	
	portfolioWithAccount1 _ Portfolio new.
	account1 _ ReceptiveAccount new.
	portfolioWithAccount1 add:account1.
	
	portfolioWithAccount1AndAccount2 _ Portfolio  new.
	account2 _ ReceptiveAccount new.
	portfolioWithAccount1AndAccount2 add: account1.
	portfolioWithAccount1AndAccount2 add: account2.
	
	portfolioWithAccount2AndPortfolioWithAccount1 _ Portfolio new.
	portfolioWithAccount2AndPortfolioWithAccount1 add: account2.
	portfolioWithAccount2AndPortfolioWithAccount1 add: portfolioWithAccount1.! !


!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Te 6/7/2022 22:24:30'!
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'xd 6/6/2022 20:30:45'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) transferValue
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

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test01TransferWithAValueChangesCorrectlyBalanceInBothAccounts


	self transferenceBetweenTwoAccountsForAValue:10*peso.
	
	self assert: 0*peso equals: account1 balance.
	self assert: 10*peso equals: account2 balance.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test02TransferCanRegisterDepositOrWithdrawInInRespectiveAccount
	| transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue:10*peso.
	self assert: (account1 hasRegistered: (transference withdraw)).
	self assert: (account2 hasRegistered: (transference deposit)).! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test03TransferValueIsRegisteredCorrectly
	|transference|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 20*peso.
	self assert: ( transference transferValueIsEqualToAValue: 20*peso).
! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'Te 6/7/2022 13:26:13'!
test04EachLegCanRecognizeItsCounterpartCorrectly
	| transference withdrawLeg depositLeg|
	
	transference _ self transferenceBetweenTwoAccountsForAValue: 10*peso.
	withdrawLeg _ transference withdrawLeg.
	depositLeg _ transference depositLeg.
	 
	self assert: ( withdrawLeg itsCounterpartIs: depositLeg).
	self assert: ( depositLeg itsCounterpartIs: withdrawLeg).
! !

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
transferenceBetweenTwoAccountsForAValue:aValue
	| transference|
	Deposit register: aValue on: account1.
	transference _ account1 transfer: aValue to: account2.
	^transference.	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue 

	self subclassResponsibility ! !

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
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:30:45'!
conBalance: aBalance
	^aBalance + self transferValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue

	^ value.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'xd 6/6/2022 20:30:45'!
conBalance: aBalance
	^aBalance - self transferValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #DepositLeg
	instanceVariableNames: 'deposit counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'initialization' stamp: 'FH 6/5/2022 20:11:50'!
initializeRegister: aValue on: aReceptiveAccount 
	deposit _ Deposit register: aValue on: aReceptiveAccount. 
	"value := aValue.
	receptiveAccount := aReceptiveAccount."! !


!DepositLeg methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:39:32'!
counterpart: aWithdrawLeg 
	counterpart _ aWithdrawLeg. ! !

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
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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
	transferValue _ aValue.
	withdrawLeg _ aWithdraw.
	depositLeg _ aDeposit. 
! !


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
	^ aValue = transferValue.
	
	! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:41:40'!
withdraw
	^withdrawLeg withdraw.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:42:31'!
withdrawLeg
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: 'valueOfTransference'!

!Transference class methodsFor: 'instance creation' stamp: 'xd 6/6/2022 20:32:46'!
register: aValue from: aGiverAccount to: aReceiverAccount 
	|withdraw deposit|
	"valueOfTransference := aValue.
	withdraw := WithdrawLeg register: self on: aGiverAccount.
	deposit _ DepositLeg register: self on: aReceiverAccount."
	withdraw _ WithdrawLeg register: aValue on: aGiverAccount.
	deposit _ DepositLeg register: aValue on: aReceiverAccount.
	withdraw counterpart: deposit.
	deposit counterpart: withdraw.
	^self new initializeWith: withdraw and: deposit and: aValue. ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #WithdrawLeg
	instanceVariableNames: 'withdraw counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawLeg class
	instanceVariableNames: ''!

!WithdrawLeg class methodsFor: 'instance creation' stamp: 'FH 6/5/2022 20:00:33'!
register: aValue on: aReceptiveAccount 

	^self new initializeRegister: aValue on: aReceptiveAccount ! !
