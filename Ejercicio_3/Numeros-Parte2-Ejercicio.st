!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'sfdga 5/7/2022 12:22:07'!
/ aDivisor

	self subclassResponsibility. ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:12:14'!
beAddedToAnEntero: UnEnteroASerSumado
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:30:46'!
beAddedToAnFraccion: UnaFraccionASerSumada
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:22:27'!
beDividedByAEntero: aDivisor
 	self subclassResponsibility. ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:43:08'!
beDividedByAFraccion: aDivisor
 	self subclassResponsibility. ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:48:49'!
beMultipliedByAEntero: aMultiplier
	self subclassResponsibility.! !

!Numero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 02:08:03'!
beMultipliedByAFraccion: aMultiplier
 self subclassResponsibility. ! !

!Numero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 13:44:15'!
beSubstractedToAFraccion: aMinuend
	self subclassResponsibility .! !

!Numero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 13:17:47'!
beSubstractedToAnEntero: aMinuend
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'te 1/1/1980 01:47:27'!
* aMultiplier 
	^aMultiplier beMultipliedByAEntero: self.
	
	
	"(aMultiplier isKindOf: Fraccion ) ifTrue:[
		^(self *aMultiplier numerator) / aMultiplier denominator].
	(aMultiplier isKindOf: self class ) ifTrue:[
		^self class with: value * aMultiplier integerValue]."

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'te 1/1/1980 01:12:14'!
+ anAdder 
	^anAdder beAddedToAnEntero: self.
	"(anAdder isKindOf: Fraccion)ifTrue: [		^self * anAdder denominator + anAdder numerator  / anAdder denominator].
	(anAdder isKindOf: self class)ifTrue: [^self class with: value + anAdder integerValue].
	^self invalidNumberType. "
	"anAdder"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sfdga 5/7/2022 13:12:14'!
- aSubtrahend 
	
	^aSubtrahend beSubstractedToAnEntero: self.
	"(aSubtrahend isKindOf: Fraccion)ifTrue: [		^self * aSubtrahend denominator - aSubtrahend numerator  / aSubtrahend denominator].
	(aSubtrahend isKindOf: self class)ifTrue: [^self class with: value - aSubtrahend integerValue].	"
	
	
	"^ self class with: value - aSubtrahend integerValue."! !

!Entero methodsFor: 'arithmetic operations' stamp: 'sfdga 5/7/2022 12:24:34'!
/ aDivisor 
	^aDivisor beDividedByAEntero: self.
	"(aDivisor isKindOf: Fraccion ) ifTrue:[
		^(self *aDivisor denominator ) / aDivisor numerator].
	(aDivisor isKindOf: self class ) ifTrue:[
		^Fraccion with: self over: aDivisor]."! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:12:14'!
beAddedToAnEntero: UnEnteroASerSumado
	^self class with: value + UnEnteroASerSumado integerValue.
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:22:41'!
beAddedToAnFraccion: UnaFraccionASerSumada
	^self * UnaFraccionASerSumada denominator + UnaFraccionASerSumada numerator  / UnaFraccionASerSumada denominator.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:25:13'!
beDividedByAEntero: aDivisor
	^Fraccion with: aDivisor over: self
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:38:41'!
beDividedByAFraccion: aDivisor
	^Fraccion with: aDivisor numerator over: aDivisor denominator * self
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:46:23'!
beMultipliedByAEntero: aMultiplier
	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:50:29'!
beMultipliedByAFraccion: aMultiplier
	^(self * aMultiplier numerator) / aMultiplier denominator! !

!Entero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 13:43:42'!
beSubstractedToAFraccion: aMinuend
	^aMinuend numerator- (self * aMinuend denominator)/ aMinuend denominator! !

!Entero methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 13:24:31'!
beSubstractedToAnEntero: aMinuend
	^self class with: aMinuend  integerValue - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'JS 5/5/2022 03:55:37'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'te 1/1/1980 02:04:41'!
* aMultiplier 
	^aMultiplier beMultipliedByAFraccion: self.
	"(aMultiplier isKindOf: Entero ) ifTrue:[
		^(aMultiplier *self numerator) / self denominator].
	(aMultiplier isKindOf: self class ) ifTrue:[
		^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)]."
	"^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)"
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'te 1/1/1980 01:31:16'!
+ anAdder 
	^anAdder beAddedToAnFraccion: self.
	"| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator "! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sfdga 5/7/2022 13:40:52'!
- aSubtrahend 
	
	aSubtrahend beSubstractedToAFraccion: self.
	
	"(aSubtrahend isKindOf: Entero ) ifTrue:[
		^self numerator- (aSubtrahend * self denominator)/ self denominator].
	(aSubtrahend isKindOf: self class ) ifTrue:[
		| newNumerator newDenominator |
	
	newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator]."
	
	
	"| newNumerator newDenominator |
	
	newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator "
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'sfdga 5/7/2022 12:37:56'!
/ aDivisor 
	
	^aDivisor beDividedByAFraccion: self.
	"(aDivisor isKindOf: self class ) ifTrue:[
		^( numerator *aDivisor denominator ) / (aDivisor numerator * denominator)].
	(aDivisor isKindOf: Entero ) ifTrue:[
		^Fraccion with: numerator over: denominator * aDivisor ]."
	
	"^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)"! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:22:53'!
beAddedToAnEntero: UnEnteroASerSumado
	^UnEnteroASerSumado * self denominator + self numerator  / self denominator.
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:21:27'!
beAddedToAnFraccion: UnaFraccionASerSumada
		
	| newNumerator newDenominator |
	
	newNumerator := (numerator * UnaFraccionASerSumada denominator) + (denominator * UnaFraccionASerSumada numerator).
	newDenominator := denominator * UnaFraccionASerSumada denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:33:20'!
beDividedByAEntero: aDivisor
	^(aDivisor *self denominator ) / self numerator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 12:47:37'!
beDividedByAFraccion: aDivisor
	^( aDivisor numerator * denominator ) / ( numerator * aDivisor denominator).! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 01:45:16'!
beMultipliedByAEntero: aMultiplier
		^(aMultiplier *self numerator) / self denominator.
	! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'te 1/1/1980 02:01:26'!
beMultipliedByAFraccion: aMultiplier
		^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 13:40:10'!
beSubstractedToAFraccion: aMinuend
	| newNumerator newDenominator |
	
	newNumerator := (aMinuend numerator * denominator) - ( aMinuend denominator *  numerator).
	newDenominator := aMinuend denominator *  denominator.
	
	^newNumerator / newDenominator
	
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'sfdga 5/7/2022 13:16:59'!
beSubstractedToAnEntero: aMinuend
	^aMinuend * self denominator - self numerator  / self denominator.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
