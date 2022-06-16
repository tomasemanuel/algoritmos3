!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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


!classDefinition: #ReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportsTest
	instanceVariableNames: 'accountWithNoTransactions accountWithADeposit accountWithAWithdraw accountWithADepositAndAWithdraw accountWithAWithdrawAndADeposit accountWithATransferDeposit emptyPortfolio accountWithATransferWithdraw accountwithADepositAndTransferWithdraw emptyFamilyPortfolio familyPortfolioWithOneChildrenAccountWithNoTransactions familyPortfolioWithTwoChildrenAccountWithBothDeposits familyPortfolioWithChildrenPortfolioAndAccountWithNoTransactions familyPortfolioWithOneChildrenAccountWithADeposit familyPortfolioWithChildrenPortfolioHavingTwoAccountsWithTransactionsAndAccountWithNoTransactions accountWithATransferWithdrawAndTransferDeposit familyPortfolioWithOneChildrenAccountWithATransferDeposit familyPortfolioWithTwoChildrenAccountWithATransferDepositAndATransferWithdraw childrenPortafolioWithTwoChildrenHavingDeposits'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'k 6/16/2022 15:41:05'!
test01assertThatAReportOfAnAccountWithNoTransfersGivesTheCorrectNetTransfer
    |netTransfer |
  
    netTransfer _ NetTransfer withAccount: accountWithNoTransactions.

    self assert:(0 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:33:09'!
test02assertThatAReportOfAnAccountWithOnlyDepositGivesTheCorrectNetTransfer
    |netTransfer |
  
    netTransfer _ NetTransfer withAccount: accountWithADeposit.

    self assert:(0 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:33:38'!
test03assertThatAReportOfAnAccountWithOnlyWithdrawGivesTheCorrectNetTransfer
    |netTransfer |
  
    netTransfer _ NetTransfer withAccount: accountWithAWithdraw.

    self assert:(0 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:33:55'!
test04assertThatAReportOfAnAccountWithATransferWithdrawGivesTheCorrectNetTransfer
   |netTransfer |
  
    netTransfer _  NetTransfer withAccount: accountWithATransferWithdraw.

    self assert:(-100 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:34:24'!
test05assertThatAReportOfAnAccountWithATransferDepositGivesTheCorrectNetTransfer
   |netTransfer |
  
    netTransfer _  NetTransfer withAccount: accountWithATransferDeposit.

    self assert:(100 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:34:42'!
test06assertThatAReportOfAnAccountWithATransferWithdrawAndADepositGivesCorrectlyTheNetTransfer
     |netTransfer |

    netTransfer _  NetTransfer withAccount: accountwithADepositAndTransferWithdraw.

    self assert:(-500 * peso = (netTransfer createNetTransfer)).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'k 6/16/2022 15:41:53'!
test07assertThatAReportOfAnAccountWithATransferWithdrawAndATransferDepositGivesCorrectlyTheNetTransfer
    |netTransfer account1 account2|

	account1  _ ReceptiveAccount new.
	account2 _  ReceptiveAccount new.
	Transfer amount: 100 * peso from: account1 to: account2. 
	Transfer amount: 50 * peso from: account2 to: account1. 
	 netTransfer _ NetTransfer withAccount: account1.

    self assert:(-50 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:36:04'!
test08assertThatAReportOfAPortfolioWithNoTransfersGivesTheCorrectNetTransfer
    |netTransfer |

    netTransfer _ NetTransfer withAccount: emptyPortfolio.

    self assert:(0 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:37:45'!
test09assertThatAReportOfAPortfolioWithOneAccountHavingDepositGivesTheCorrectNetTransfer
    |netTransfer |

    netTransfer _ NetTransfer withAccount: familyPortfolioWithOneChildrenAccountWithADeposit.

    self assert:(0 * peso = (netTransfer createNetTransfer)).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:39:05'!
test10assertThatAReportOfAPortfolioWithTwoAccountsHavingBothOfThemDepositsGivesTheCorrectNetTransfer
    |netTransfer |

    netTransfer _ NetTransfer withAccount: familyPortfolioWithTwoChildrenAccountWithBothDeposits.

    self assert:(0 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:40:00'!
test11assertThatAReportOfAPortfolioWithOneAccountHavingATransferDepositGivesTheCorrectNetTransfer
    |netTransfer |

    netTransfer _ NetTransfer withAccount: familyPortfolioWithOneChildrenAccountWithATransferDeposit.

    self assert:(100 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:43:27'!
test12assertThatAReportOfAPortfolioWithTwoAccountsHavingATransferDepositAndTransferWithdrawWithTheSameValueGivesTheCorrectNetTransfer
    |netTransfer |

    netTransfer _ NetTransfer withAccount: familyPortfolioWithTwoChildrenAccountWithATransferDepositAndATransferWithdraw.

    self assert:(0 * peso = (netTransfer createNetTransfer )).! !

!ReportsTest methodsFor: 'tests NetTransferReports' stamp: 'FH 6/16/2022 18:44:04'!
test13assertThatAReportOfAPortfolioWithAnAccountHavingDepositWithdrawTransferDepositAndTransferWithdrawGivesTheCorrectNetTransfer
    |netTransfer account1 account2 portfolio|

    account1 _  ReceptiveAccount new.
    account2 _ ReceptiveAccount new.
    Deposit register: 20* peso on: account1.
    Withdraw register: 20* peso on: account2.
    Transfer amount: 500 * peso from: account2 to: account1. 
    Transfer amount: 100 * peso from: account1 to: account2.
    portfolio _ Portfolio with: account1.
    netTransfer _ NetTransfer withAccount: portfolio.

    self assert:(400 * peso = (netTransfer createNetTransfer )).! !


!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:21:24'!
test01assertThatAnAccountSummayOfAnAccountWithoutTransactionsPrintsOnlyThatBalanceIsZeroPesos
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary withAccount:accountWithNoTransactions.
	
	coleccionDeStringDeTransacciones _ OrderedCollection with:'Balance = 0 * pesos' .
	
	self assert:(coleccionDeStringDeTransacciones = (accountSummary createSummary )). ! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:22:54'!
test02assertThatAnAccountSummaryOfAnAccountWithDepositPrintsTheDepositOfAValueAndAccountBalance
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithADeposit.
	
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Deposit of 100 * pesos'with:'Balance = 100 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary )). ! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:22:48'!
test03assertThatAnAccountSummaryOfAnAccountWithWithdrawPrintsTheWithdrawOfAValueAndAccountBalance
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithAWithdraw.
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Withdraw of 100 * pesos'with:'Balance = -100 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary )).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:23:41'!
test04assertThatAnAccountSummaryOfAnAccountWithDepositAndThenWithdrawPrintsCorrectlyTheTransactionsAndBalance
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithADepositAndAWithdraw.
	
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Deposit of 150 * pesos' with: 'Withdraw of 100 * pesos' with:'Balance = 50 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:24:17'!
test05assertThatAnAccountSummaryOfAnAccountWithWithdrawAndThenDepositPrintsCorrectlyTheTransactionsAndBalance
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithAWithdrawAndADeposit.
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Withdraw of 100 * pesos' with:'Deposit of 150 * pesos' with:'Balance = 50 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:25:02'!
test06assertThatAnAccountSummaryOfAnAccountWithATransferDepositMadePrintsItsTransactionAndBalanceCorrectly
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithATransferDeposit.
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Transference`s Deposit of 100 * pesos' with:'Balance = 100 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:25:48'!
test07assertThatAnAccountSummaryOfAnAccountWithATransferWithdrawMadePrintsItsTransactionAndBalanceCorrectly
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithATransferWithdraw.
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Transference`s Withdraw of 100 * pesos' with:'Balance = -100 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:27:18'!
test08assertThatAnAccountSummaryOfAnAccountWithTransferWithdrawAndThenTransferDepositPrintsCorrectlyTheTransactionsAndBalance
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: accountWithATransferWithdrawAndTransferDeposit.
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Transference`s Withdraw of 100 * pesos' with: 'Transference`s Deposit of 100 * pesos' with:'Balance = 0 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:28:12'!
test09assertThatAnAccountSummaryOfAnAccountWithDepositWithdrawTransferDepositAndTransferWithdrawPrintsCorrectlyTheTransactionsAndTheBalance
	|accountSummary account1 account2 coleccionDeStringDeTransacciones |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 200 * peso on: account1.
	Deposit register: 150 * peso on: account1.
	Withdraw register: 100 * peso on: account1. 
	Transfer amount: 100*peso from: account2 to: account1.
	Transfer amount: 50*peso from: account1 to: account2.
	accountSummary _ AccountSummary withAccount: account1.
	
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Deposit of 200 * pesos' with: 'Deposit of 150 * pesos'  with: 'Withdraw of 100 * pesos' with: 'Transference`s Deposit of 100 * pesos'with: 'Transference`s Withdraw of 50 * pesos'  with:'Balance = 300 * pesos' .
	self assert:(	coleccionDeStringDeTransacciones = (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:28:33'!
test10AssertThatAnAccountSummaryOfAnEmptyPortfolioPrintsCorrectlyTheBalance
	|accountSummary coleccionDeStringDeTransacciones |
	
	accountSummary _ AccountSummary  withAccount: emptyPortfolio.
	
	coleccionDeStringDeTransacciones _ OrderedCollection with:'Balance = 0 * pesos' .
	
	self assert:(coleccionDeStringDeTransacciones= (accountSummary createSummary)).! !

!ReportsTest methodsFor: 'tests Account Summary' stamp: 'FH 6/16/2022 18:31:20'!
test11AssertThatAnAccountSummaryOfAPortfolioWithAnAccountWithDepositAndWithdrawPrintsCorrectlyTheTransactionsAndTheBalance
	|accountSummary account1 portfolio coleccionDeStringDeTransacciones |
	
	account1 _ ReceptiveAccount new.
	Deposit register: 150 * peso on: account1.
	Withdraw register: 100 * peso on: account1. 
	portfolio _ Portfolio with: account1.
	accountSummary _ AccountSummary withAccount: portfolio.
	coleccionDeStringDeTransacciones _ OrderedCollection with: 'Deposit of 150 * pesos' with: 'Withdraw of 100 * pesos' with:'Balance = 50 * pesos' .
	self assert:(coleccionDeStringDeTransacciones = (accountSummary createSummary )).! !


!ReportsTest methodsFor: 'tests ExtraPart2' stamp: 'FH 6/16/2022 17:34:42'!
test20assertThatAReportOfAnEmptyPortfolioPrintsCorrectlyTheDetailedTreePrinter

	| detailedTreePrinter coleccionDeStringDeCuentas |

    detailedTreePrinter _ PortfolioDetailedTreePrinter withAccount: emptyFamilyPortfolio.

    coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Balance = 0 * pesos'.
    self assert: coleccionDeStringDeCuentas = detailedTreePrinter createDetailedTreePrinter.
	! !

!ReportsTest methodsFor: 'tests ExtraPart2' stamp: 'FH 6/16/2022 17:40:54'!
test21assertThatAReportOfAPortfolioWithOneAccountWithNoTransactionPrintsCorrectlyTheDetailedTreePrinter
	
	| detailedTreePrinter aColectionOfDetailedAccountStrings aAuxiliarCollectionOfDetailedAccountStrings |

    detailedTreePrinter _ PortfolioDetailedTreePrinter withAccount: familyPortfolioWithOneChildrenAccountWithNoTransactions.

    aColectionOfDetailedAccountStrings _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Toms Account' with:String tab with:String tab with:'Balance = 0 * pesos'.
    aAuxiliarCollectionOfDetailedAccountStrings _ OrderedCollection with:String tab with:'Balance = 0 * pesos' .
    aColectionOfDetailedAccountStrings addAllLast: aAuxiliarCollectionOfDetailedAccountStrings.

    self assert: aColectionOfDetailedAccountStrings = detailedTreePrinter createDetailedTreePrinter .
	! !

!ReportsTest methodsFor: 'tests ExtraPart2' stamp: 'FH 6/16/2022 17:42:10'!
test22assertThatAReportOfAPortfolioWithOneAccountWithATransactionPrintsCorrectlyTheDetailedTreePrinter

	| aAuxiliarCollectionOfDetailedAccountStrings aColectionOfDetailedAccountStrings detailedTreePrinter |
    
	detailedTreePrinter _ PortfolioDetailedTreePrinter withAccount: familyPortfolioWithOneChildrenAccountWithADeposit.

	aColectionOfDetailedAccountStrings _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Johns Account' with:String tab with:String tab with:'Deposit of 100 * pesos'.
	aAuxiliarCollectionOfDetailedAccountStrings _ OrderedCollection with:String tab with:String tab with:'Balance = 100 * pesos' with:String tab with:'Balance = 100 * pesos'.
    aColectionOfDetailedAccountStrings addAllLast: aAuxiliarCollectionOfDetailedAccountStrings.

    self assert: aColectionOfDetailedAccountStrings =detailedTreePrinter createDetailedTreePrinter.! !

!ReportsTest methodsFor: 'tests ExtraPart2' stamp: 'FH 6/16/2022 17:44:49'!
test23assertThatAReportOfAPortfolioWithTwoAccountsWithBothDepositsMadePrintsTheTreePrinterCorrectly

	| aAuxiliarCollectionOfDetailedAccountStrings aColectionOfDetailedAccountStrings detailedTreePrinter anotherAuxiliarCollectionOfDetailedAccountStrings |

    detailedTreePrinter _ PortfolioDetailedTreePrinter withAccount: familyPortfolioWithTwoChildrenAccountWithBothDeposits.

    aColectionOfDetailedAccountStrings _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Johns Account' with:String tab with:String tab with:'Deposit of 100 * pesos'.

    aAuxiliarCollectionOfDetailedAccountStrings _ OrderedCollection with:String tab with:String tab with:'Balance = 100 * pesos' with:String tab with:'Angies Account'.

    anotherAuxiliarCollectionOfDetailedAccountStrings _ OrderedCollection with:String tab with:String tab with: 'Deposit of 150 * pesos' with:String tab with:String tab with:'Balance = 150 * pesos'.
    anotherAuxiliarCollectionOfDetailedAccountStrings add:String tab.
    anotherAuxiliarCollectionOfDetailedAccountStrings add: 'Balance = 250 * pesos'.

    aColectionOfDetailedAccountStrings addAllLast: aAuxiliarCollectionOfDetailedAccountStrings.
    aColectionOfDetailedAccountStrings addAllLast: anotherAuxiliarCollectionOfDetailedAccountStrings.

    self assert: aColectionOfDetailedAccountStrings = detailedTreePrinter createDetailedTreePrinter.
	
	! !

!ReportsTest methodsFor: 'tests ExtraPart2' stamp: 'FH 6/16/2022 18:42:36'!
test24assertThatAPortfolioWithTwoAccountsHavingBothADepositAndOneHavingATransferencePrintsCorrectlyTheDetailedTreePrinter

	| familyPortfolio detailedTreePrinter johnsAccount angiesAccount tomAccount coleccionAuxiliarDeStringDeCuentas coleccionDeStringDeCuentas coleccionAuxiliarDeStringDeCuentas2|
	
	johnsAccount := ReceptiveAccount named: 'Johns Account'.
	Deposit register: 100 * peso on: johnsAccount.
	angiesAccount := ReceptiveAccount named: 'Angies Account'.
	Deposit register: 150 * peso on: angiesAccount.
	tomAccount  _ ReceptiveAccount named: 'Tom Account'.
	Transfer amount: 100*peso from: tomAccount to: johnsAccount.
	familyPortfolio := Portfolio named: 'Family Portfolio' with: johnsAccount with:angiesAccount .
	detailedTreePrinter _ PortfolioDetailedTreePrinter withAccount: familyPortfolio.
	
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Johns Account' with:String tab with:String tab.
	coleccionAuxiliarDeStringDeCuentas _ OrderedCollection with:'Deposit of 100 * pesos' with:String tab with:String tab with: 'Transference`s Deposit of 100 * pesos' with:String tab with:String tab.
	coleccionAuxiliarDeStringDeCuentas add: 'Balance = 200 * pesos'.
	
	coleccionAuxiliarDeStringDeCuentas2 _ OrderedCollection with: String tab with: 'Angies Account' with:String tab with:String tab with: 'Deposit of 150 * pesos' with: String tab.
	coleccionAuxiliarDeStringDeCuentas2 add: String tab.
	coleccionAuxiliarDeStringDeCuentas2 add: 'Balance = 150 * pesos'.
	coleccionAuxiliarDeStringDeCuentas2 add: String tab.
	coleccionAuxiliarDeStringDeCuentas2 add: 'Balance = 350 * pesos'.
	
	coleccionDeStringDeCuentas addAllLast:coleccionAuxiliarDeStringDeCuentas.
	coleccionDeStringDeCuentas addAllLast:coleccionAuxiliarDeStringDeCuentas2.
	
	self assert: coleccionDeStringDeCuentas = (detailedTreePrinter createDetailedTreePrinter).
	
	! !

!ReportsTest methodsFor: 'tests ExtraPart2' stamp: 'FH 6/16/2022 18:42:30'!
test25assertThatAReportOfAPortfolioWithAnAccountAndAPortfolioWithTwoOtherAccountHavingTransactionsPrintsCorrectlyTheDetailedTreePrinter
	
	| aAuxiliarCollectionOfDetailedAccountStrings aColectionOfDetailedAccountStrings detailedTreePrinter anotherAuxiliarCollectionOfDetailedAccountStrings familyPortfolio johnsAccount childrenPortfolio tomAccount angiesAccount|

    johnsAccount := ReceptiveAccount named: 'Johns Account'.
    angiesAccount := ReceptiveAccount named: 'Angies Account'.
    tomAccount := ReceptiveAccount named: 'Toms Account'.
    childrenPortfolio := Portfolio named: 'Children Portfolio' with:johnsAccount with: angiesAccount . 
    familyPortfolio := Portfolio named: 'Family Portfolio' with: tomAccount with:childrenPortfolio .
    Deposit register: 150 * peso on: tomAccount . 

    Deposit register: 50 * peso on: johnsAccount .
    detailedTreePrinter _ PortfolioDetailedTreePrinter withAccount: familyPortfolio.

    aColectionOfDetailedAccountStrings _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Toms Account' with:String tab with:String tab with:'Deposit of 150 * pesos'.
    2 timesRepeat:[aColectionOfDetailedAccountStrings add:String tab].
    aColectionOfDetailedAccountStrings add: 'Balance = 150 * pesos'.
    aColectionOfDetailedAccountStrings add: String tab.
aAuxiliarCollectionOfDetailedAccountStrings _ OrderedCollection with:'Children Portfolio'.
    2 timesRepeat:[ aAuxiliarCollectionOfDetailedAccountStrings add:String tab].
    aAuxiliarCollectionOfDetailedAccountStrings add:'Johns Account'.
    3 timesRepeat:[aAuxiliarCollectionOfDetailedAccountStrings add:String tab].

    anotherAuxiliarCollectionOfDetailedAccountStrings _ OrderedCollection with:'Deposit of 50 * pesos'.
    3 timesRepeat:[anotherAuxiliarCollectionOfDetailedAccountStrings add:String tab].
    anotherAuxiliarCollectionOfDetailedAccountStrings add: 'Balance = 50 * pesos'.
    2 timesRepeat:[anotherAuxiliarCollectionOfDetailedAccountStrings add:String tab].
    anotherAuxiliarCollectionOfDetailedAccountStrings add: 'Angies Account'.
    3 timesRepeat:[anotherAuxiliarCollectionOfDetailedAccountStrings add:String tab].
    anotherAuxiliarCollectionOfDetailedAccountStrings add: 'Balance = 0 * pesos'.
    2 timesRepeat:[anotherAuxiliarCollectionOfDetailedAccountStrings add:String tab].
    anotherAuxiliarCollectionOfDetailedAccountStrings add: 'Balance = 50 * pesos'.
anotherAuxiliarCollectionOfDetailedAccountStrings add: String tab.
    anotherAuxiliarCollectionOfDetailedAccountStrings add: String tab.
    anotherAuxiliarCollectionOfDetailedAccountStrings add: 'Balance = 200 * pesos'.

    aColectionOfDetailedAccountStrings addAllLast: aAuxiliarCollectionOfDetailedAccountStrings.
    aColectionOfDetailedAccountStrings addAllLast: anotherAuxiliarCollectionOfDetailedAccountStrings.

    self assert: aColectionOfDetailedAccountStrings = detailedTreePrinter createDetailedTreePrinter.
	! !


!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'k 6/16/2022 16:00:41'!
test01assertThatAReportOfAnEmptyPortfolioPrintsCorrectlyTheTreePrinter
	
	| treePrinter coleccionDeStringDeCuentas |
	treePrinter _ PortfolioTreePrinter withAccount: emptyFamilyPortfolio.
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio'.
	
	self assert: coleccionDeStringDeCuentas =treePrinter createTreePrinter.
	! !

!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'FH 6/16/2022 16:34:49'!
test02assertThatAReportOfAPortfolioWithOneAccountPrintsCorrectlyTheTreePrinter
	
	| treePrinter coleccionDeStringDeCuentas |
	treePrinter _ PortfolioTreePrinter withAccount: familyPortfolioWithOneChildrenAccountWithNoTransactions.
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Toms Account'.
self assert: coleccionDeStringDeCuentas = treePrinter createTreePrinter.
	! !

!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'k 6/16/2022 16:00:57'!
test03assertThatAReportOfAPortfolioWithEmptyPortfolioPrintsCorrectlyTheTreePrinter
	
	| treePrinter familyPortfolioWithEmptyPortfolio coleccionDeStringDeCuentas |
	familyPortfolioWithEmptyPortfolio _ Portfolio named:'Family Portfolio' with:emptyPortfolio .
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Children Portfolio'.
	treePrinter _ PortfolioTreePrinter withAccount: familyPortfolioWithEmptyPortfolio.
	self assert: 
coleccionDeStringDeCuentas = treePrinter createTreePrinter .
	! !

!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'k 6/16/2022 16:01:04'!
test04assertThatAReportOfAPortfolioWithTwoAccountsPrintsCorrectlyTheTreePrinter
	
	| treePrinter coleccionDeStringDeCuentas |
	treePrinter _ PortfolioTreePrinter withAccount: familyPortfolioWithTwoChildrenAccountWithBothDeposits.
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Johns Account' with:String tab with:'Angies Account' .
	self assert: coleccionDeStringDeCuentas = treePrinter createTreePrinter .
	! !

!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'k 6/16/2022 16:01:10'!
test05assertThatAReportOfAPortfolioWithAnAccountAndAPortfolioPrintsCorrectlyTheTreePrinter
	
	| treePrinter coleccionDeStringDeCuentas |
	treePrinter _ PortfolioTreePrinter withAccount: familyPortfolioWithChildrenPortfolioAndAccountWithNoTransactions.
	
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Toms Account' with:String tab with:'Children Portfolio' .
	self assert: coleccionDeStringDeCuentas = treePrinter createTreePrinter .
	! !

!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'FH 6/16/2022 18:44:23'!
test06assertThatAReportOfAPortfolioWithAnAccountAndAPortfolioHavingTwoAccountWithTransactionsPrintsCorrectlyTheTreePrinter
	
	| treePrinter coleccionDeStringDeCuentas coleccionAuxiliarDeStringDeCuentas |
	treePrinter _ PortfolioTreePrinter withAccount: familyPortfolioWithChildrenPortfolioHavingTwoAccountsWithTransactionsAndAccountWithNoTransactions.
	
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Toms Account' with:String tab with:'Children Portfolio' .
	
	coleccionAuxiliarDeStringDeCuentas _ OrderedCollection with:String tab with:String tab with: 'Johns Account' with:String tab with:String tab with:'Angies Account' .
	coleccionDeStringDeCuentas addAllLast:coleccionAuxiliarDeStringDeCuentas . 
	
	self assert: coleccionDeStringDeCuentas = treePrinter createTreePrinter .
	! !

!ReportsTest methodsFor: 'tests ExtraPart1' stamp: 'FH 6/16/2022 18:45:00'!
test07assertThatAReportOfAPortfolioWithAnAccountAndAPortfolioAndAPortfolioHavingTwoAccountWithTransactionsPrintsCorrectlyTheTreePrinter
	
	| treePrinter nephewPortfolio coleccionDeStringDeCuentas coleccionAuxiliarDeStringDeCuentas |
	
	nephewPortfolio _ Portfolio named: 'Nephew Portfolio'.
	familyPortfolioWithChildrenPortfolioHavingTwoAccountsWithTransactionsAndAccountWithNoTransactions add: nephewPortfolio.
	 
	treePrinter _ PortfolioTreePrinter withAccount: familyPortfolioWithChildrenPortfolioHavingTwoAccountsWithTransactionsAndAccountWithNoTransactions.
	
	coleccionDeStringDeCuentas _ OrderedCollection with:'Family Portfolio' with:String tab with: 'Toms Account' with:String tab with:'Children Portfolio' .
	
	coleccionAuxiliarDeStringDeCuentas _ OrderedCollection with:String tab with:String tab with: 'Johns Account' with:String tab with:String tab with:'Angies Account' .
	coleccionAuxiliarDeStringDeCuentas add: String tab.
	coleccionAuxiliarDeStringDeCuentas add: 'Nephew Portfolio'.
	coleccionDeStringDeCuentas addAllLast:coleccionAuxiliarDeStringDeCuentas . 
	
	self assert: coleccionDeStringDeCuentas = treePrinter createTreePrinter .
	! !


!ReportsTest methodsFor: 'setUp' stamp: 'k 6/16/2022 16:00:21'!
setUp
	
	
	| account2 anotherAccountWithADeposit |
	accountWithNoTransactions _ ReceptiveAccount named: 'Toms Account'.
	
	accountWithADeposit _  ReceptiveAccount named: 'Johns Account'.
	Deposit register: 100 * peso on: accountWithADeposit. 
	
	accountWithAWithdraw _ ReceptiveAccount new.
	Withdraw register: 100 * peso on: accountWithAWithdraw. 
	
	accountWithADepositAndAWithdraw _ ReceptiveAccount new.
	Deposit register: 150 * peso on: accountWithADepositAndAWithdraw.
	Withdraw register: 100 * peso on: accountWithADepositAndAWithdraw.
	
	accountWithAWithdrawAndADeposit _ ReceptiveAccount new.
	Withdraw register: 100 * peso on: accountWithAWithdrawAndADeposit.
	Deposit register: 150 * peso on: accountWithAWithdrawAndADeposit.
	
	accountWithATransferWithdraw _ ReceptiveAccount new.
	accountWithATransferDeposit _  ReceptiveAccount new.
	Transfer amount: 100*peso from: accountWithATransferWithdraw to: accountWithATransferDeposit.
	
	account2 _ ReceptiveAccount new.
	accountwithADepositAndTransferWithdraw _  ReceptiveAccount new.
	Deposit register: 20 * peso on: accountwithADepositAndTransferWithdraw.
	Transfer amount: 500 * peso from: accountwithADepositAndTransferWithdraw to: account2.
	
	accountWithATransferWithdrawAndTransferDeposit _ ReceptiveAccount new.
	Transfer amount: 100 * peso from: accountWithATransferWithdrawAndTransferDeposit to: account2.
	Transfer amount: 100 * peso from: account2 to: accountWithATransferWithdrawAndTransferDeposit.
	
	
	emptyPortfolio _ Portfolio named: 'Children Portfolio'.
	
	emptyFamilyPortfolio _ Portfolio named: 'Family Portfolio'.
	familyPortfolioWithOneChildrenAccountWithATransferDeposit _ Portfolio named:'Family Portfolio' with: accountWithATransferDeposit.
	
	familyPortfolioWithTwoChildrenAccountWithATransferDepositAndATransferWithdraw _ Portfolio named:'Family Portfolio' with: accountWithATransferDeposit with: accountWithATransferWithdraw .
	familyPortfolioWithOneChildrenAccountWithNoTransactions := Portfolio named: 'Family Portfolio' with: accountWithNoTransactions.
	
	familyPortfolioWithOneChildrenAccountWithADeposit := Portfolio named: 	'Family Portfolio' with: accountWithADeposit .
	
	anotherAccountWithADeposit _ ReceptiveAccount named: 'Angies Account'.
	Deposit register: 150 * peso on: anotherAccountWithADeposit. 
	
	familyPortfolioWithTwoChildrenAccountWithBothDeposits _ Portfolio named: 'Family Portfolio' with: accountWithADeposit with:anotherAccountWithADeposit .
	
	familyPortfolioWithChildrenPortfolioAndAccountWithNoTransactions _ Portfolio named: 'Family Portfolio' with: accountWithNoTransactions with:emptyPortfolio .
	
	childrenPortafolioWithTwoChildrenHavingDeposits _ Portfolio named: 'Children Portfolio' with: accountWithADeposit with: anotherAccountWithADeposit.
	
	familyPortfolioWithChildrenPortfolioHavingTwoAccountsWithTransactionsAndAccountWithNoTransactions _ Portfolio named: 'Family Portfolio' with: accountWithNoTransactions with:	childrenPortafolioWithTwoChildrenHavingDeposits
	
	
	

	
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'FH 6/16/2022 17:53:36'!
visitTransactionsFor: aReport

	self subclassResponsibility. ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'k 6/13/2022 12:32:00'!
with:anAccountName
	accountName _ anAccountName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'FH 6/11/2022 19:52:43'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'private' stamp: 'k 6/13/2022 13:09:45'!
name
	^accountName.! !

!Portfolio methodsFor: 'private' stamp: 'FH 6/16/2022 18:09:46'!
visitAccountFor:aReport
	aReport visitForPortfolio:self.
	accounts do:[:anAccount| anAccount visitAccountFor:aReport ].
	aReport visitExtraForPortfolio:self.
	! !

!Portfolio methodsFor: 'private' stamp: 'k 6/16/2022 12:42:39'!
visitTransactionsFor:aReport
	accounts do:[:anAccount| anAccount visitTransactionsFor:aReport].! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errorDescription' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'k 6/13/2022 12:33:18'!
named: anAccountName
	^self new with:anAccountName.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'k 6/13/2022 12:31:12'!
named: anAccountName with:anAccount
	^self new 
		add: anAccount;
		with:anAccountName;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'k 6/13/2022 12:32:33'!
named:anAccountName with:anAccount with: anotherAccount
	^self new 
		add: anAccount;
		add: anotherAccount;
		with: anAccountName;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'k 6/13/2022 12:17:10'!
initializeWith:anAccountName
	accountName _ anAccountName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FH 6/11/2022 19:53:16'!
balance

	^transactions 
		inject: (0*peso)
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'private' stamp: 'k 6/13/2022 12:17:43'!
name
	^accountName.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'FH 6/16/2022 18:08:19'!
visitAccountFor:aReport
	aReport visitForAReceptiveAccount:self.! !

!ReceptiveAccount methodsFor: 'private' stamp: 'k 6/16/2022 11:55:11'!
visitTransactionsFor:aReport
	transactions do:[:aTransaction| aTransaction visitTransactionFor:aReport]! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'instance creation' stamp: 'k 6/13/2022 12:16:21'!
named:anAccountName
	^self new initializeWith:anAccountName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'FH 6/16/2022 17:59:26'!
visitTransactionFor:aReport
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'private' stamp: 'FH 6/16/2022 18:13:33'!
visitTransactionFor:aReport
	aReport visitForDeposit:self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'private' stamp: 'FH 6/16/2022 18:07:38'!
visitTransactionFor:aReport
	aReport visitForTransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'private' stamp: 'FH 6/16/2022 18:07:26'!
visitTransactionFor:aReport
	aReport visitForTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'xd 6/6/2022 20:30:45'!
transferValue

	^ value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'private' stamp: 'FH 6/16/2022 18:07:15'!
visitTransactionFor:aReport
	aReport visitForWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'initialization' stamp: 'FH 6/11/2022 18:16:07'!
initializeWithAccount: anAccount 
	account _ anAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'FH 6/11/2022 18:15:36'!
withAccount: anAccount 

	^self new initializeWithAccount: anAccount. ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'collectionStringOfTransactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'private' stamp: 'FH 6/16/2022 18:05:43'!
visitForDeposit:aDeposit
	collectionStringOfTransactions add:('Deposit of ',((aDeposit value)asString)).
	
! !

!AccountSummary methodsFor: 'private' stamp: 'FH 6/16/2022 18:05:55'!
visitForTransferDepositLeg:aTransferDepositLeg
	collectionStringOfTransactions add:('Transference`s Deposit of ',((aTransferDepositLeg value)asString)).
	
! !

!AccountSummary methodsFor: 'private' stamp: 'FH 6/16/2022 18:06:07'!
visitForTransferWithdrawLeg:aTransferWithdrawLeg
	collectionStringOfTransactions add:('Transference`s Withdraw of ',((aTransferWithdrawLeg value)asString)).
! !

!AccountSummary methodsFor: 'private' stamp: 'FH 6/16/2022 18:06:17'!
visitForWithdraw:aWithdraw
	collectionStringOfTransactions add:('Withdraw of ',((aWithdraw value)asString))
! !


!AccountSummary methodsFor: 'main protocol' stamp: 'k 6/16/2022 15:15:06'!
createSummary
	collectionStringOfTransactions _ OrderedCollection new.
	account visitTransactionsFor:self.
	collectionStringOfTransactions add:('Balance = ',(account balance)asString).
	^collectionStringOfTransactions .


	
! !


!classDefinition: #NetTransfer category: 'ServiciosFinancieros-Solucion'!
Report subclass: #NetTransfer
	instanceVariableNames: 'balanceOfTransfers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!NetTransfer methodsFor: 'main protocol' stamp: 'k 6/16/2022 11:49:29'!
createNetTransfer
	balanceOfTransfers _ 0*peso.
	account visitTransactionsFor:self.
	^balanceOfTransfers .! !


!NetTransfer methodsFor: 'private' stamp: 'FH 6/16/2022 18:06:31'!
visitForDeposit:aDeposit
	! !

!NetTransfer methodsFor: 'private' stamp: 'FH 6/16/2022 18:07:38'!
visitForTransferDepositLeg:aTransferDepositLeg
	balanceOfTransfers _ aTransferDepositLeg affectBalance:balanceOfTransfers 
	! !

!NetTransfer methodsFor: 'private' stamp: 'FH 6/16/2022 18:07:26'!
visitForTransferWithdrawLeg:aTransferWithdrawLeg
	balanceOfTransfers _ aTransferWithdrawLeg affectBalance:balanceOfTransfers 
	! !

!NetTransfer methodsFor: 'private' stamp: 'FH 6/16/2022 18:07:15'!
visitForWithdraw:aWithdraw
	! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'stringOfTreeStructure cantidadDeTabs collectionStringOfAccountsWithSummary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 16:36:03'!
createDetailedTreePrinter
	
	collectionStringOfAccountsWithSummary _ OrderedCollection new.
	cantidadDeTabs _ 0.
	account visitAccountFor: self.
	^collectionStringOfAccountsWithSummary.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 18:09:13'!
visitExtraForPortfolio: aPortfolio
	"cantidadDeTabs _ cantidadDeTabs - 1."
	cantidadDeTabs timesRepeat:[collectionStringOfAccountsWithSummary add:String tab].
	collectionStringOfAccountsWithSummary add:('Balance = ',(aPortfolio balance)asString).
	! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 18:08:19'!
visitForAReceptiveAccount:aReceptiveAccount
	|accountSummary|
	accountSummary _ (AccountSummary withAccount: aReceptiveAccount) createSummary.
	cantidadDeTabs timesRepeat:[collectionStringOfAccountsWithSummary add:String tab].
	collectionStringOfAccountsWithSummary add:(aReceptiveAccount name).
	accountSummary do:[:aStringOfTransaction|
		(cantidadDeTabs+1) timesRepeat:[collectionStringOfAccountsWithSummary add:String tab].
		collectionStringOfAccountsWithSummary add:(aStringOfTransaction).
		].! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 18:09:46'!
visitForPortfolio:aPortfolio
	cantidadDeTabs timesRepeat:[collectionStringOfAccountsWithSummary add:String tab].
	collectionStringOfAccountsWithSummary add:(aPortfolio name).
	cantidadDeTabs _ cantidadDeTabs + 1.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'stringOfTreeStructure cantidadDeTabs cantidadDeLineas collectionStringOfAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'k 6/16/2022 15:14:49'!
createTreePrinter
	
	collectionStringOfAccounts _ OrderedCollection new.
	cantidadDeTabs _ 0.
	account visitAccountFor: self.
	^collectionStringOfAccounts .! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 18:09:13'!
visitExtraForPortfolio: aPortfolio
	cantidadDeTabs _ cantidadDeTabs - 1.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 18:08:19'!
visitForAReceptiveAccount:aReceptiveAccount
	cantidadDeTabs timesRepeat:[collectionStringOfAccounts add:String tab].
	collectionStringOfAccounts add:(aReceptiveAccount name)asString.
	
	! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FH 6/16/2022 18:09:46'!
visitForPortfolio:aPortfolio

	cantidadDeTabs timesRepeat:[collectionStringOfAccounts add:String tab].
	collectionStringOfAccounts add:(aPortfolio name)asString.
	cantidadDeTabs _ cantidadDeTabs + 1.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
