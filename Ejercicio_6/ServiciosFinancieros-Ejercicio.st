!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/5/2022 18:05:49'!
test01
	| account account2|
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	account transfer: 0*peso to: account2.
	
	self assert: 0 equals: account balance.
	self assert: 0 equals: account2 balance.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/5/2022 18:14:21'!
test02
	| account account2|
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 10*peso on: account.
	account transfer: 10*peso to: account2.
	
	self assert: 0*peso equals: account balance.
	self assert: 10*peso equals: account2 balance.! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/5/2022 20:41:55'!
test03
	| account account2 transference|
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 10*peso on: account.
	transference _ account transfer: 10*peso to: account2.
	
	self assert: (account hasRegistered: (transference withdraw)).
	self assert: (account2 hasRegistered: (transference deposit)).! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/5/2022 20:18:19'!
test04
	| account account2 transference|
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 10*peso on: account.
	transference _ account transfer: 10*peso to: account2.
	
	self assert: ( 10*peso isEqualTo: (transference value)).
! !

!TransferenceBetweenAccountsTest methodsFor: 'tests' stamp: 'FH 6/5/2022 20:44:25'!
test05
	| account account2 transference withdrawLeg depositLeg|
	
	account _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 10*peso on: account.
	transference _ account transfer: 10*peso to: account2.
	withdrawLeg _ transference withdrawLeg.
	depositLeg _ transference depositLeg.
	 
	self assert: ( withdrawLeg itsCounterpartIs: depositLeg).
	self assert: ( depositLeg itsCounterpartIs: withdrawLeg).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
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


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 't 6/1/2022 21:43:48'!
conBalance: aBalance
	^aBalance + self value.! !

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


!Withdraw methodsFor: 'value' stamp: 't 6/1/2022 21:19:24'!
value

	^ value.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 't 6/1/2022 21:43:15'!
conBalance: aBalance
	^aBalance - self value.! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:36:52'!
itsCounterpartIs: aDeposit 
	^(counterpart = aDeposit).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 't 6/1/2022 21:40:45'!
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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 19:59:55'!
transfer: aValue to: aReceptiveAccount

	"Withdraw register: aSimpleMeasure on: self.
	Deposit register: aSimpleMeasure on: aReceptiveAccount."

	^Transference register: aValue from: self to: aReceptiveAccount. ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #DepositLeg
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


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #WithdrawLeg
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


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'FH 6/5/2022 19:21:25'!
initializeWith: aWithdraw and: aDeposit.
	withdrawLeg _ aWithdraw.
	depositLeg _ aDeposit. 
! !


!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:41:55'!
deposit
	^depositLeg deposit.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:42:43'!
depositLeg
	^depositLeg! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:22:41'!
value
	^10*peso.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:41:40'!
withdraw
	^withdrawLeg withdraw.! !

!Transference methodsFor: 'as yet unclassified' stamp: 'FH 6/5/2022 20:42:31'!
withdrawLeg
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'FH 6/5/2022 20:38:12'!
register: aValue from: aGiverAccount to: aReceiverAccount 
	|withdraw deposit|
	withdraw _ WithdrawLeg register: aValue on: aGiverAccount.
	deposit _ DepositLeg register: aValue on: aReceiverAccount.
	withdraw counterpart: deposit.
	deposit counterpart: withdraw.
	^self new initializeWith: withdraw and: deposit. ! !
