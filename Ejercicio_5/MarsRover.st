!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'primerMarsRover segundoMarsRover marsRoverOrientadoHaciaElSur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:32:05'!
afirmarQueUnBloque: unBloque FalleConUnMarsRoverError: unMarsRoverError
	self
		should: unBloque
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = unMarsRoverError ].! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:06:06'!
afirmarUnaOrientacion: unaOrientacion despuesDeUnComando: unComando
	primerMarsRover realizarUnaSerieDeComandos: unComando.
	self assert: (primerMarsRover orientacion esIgualA: unaOrientacion).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:51:40'!
setUp
	primerMarsRover _ MarsRover conUnaOrientacionInicial: #Norte.
	segundoMarsRover _ MarsRover conUnaOrientacionInicial: #Norte.
	marsRoverOrientadoHaciaElSur _ MarsRover conUnaOrientacionInicial: #Sur.! !

!MarsRoverTest methodsFor: 'as yet unclassified'!
test01
	self assert: primerMarsRover posicion = (0 @ 0).
	self assert: (primerMarsRover orientacion esIgualA: #Norte).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:06:06'!
test02
	primerMarsRover realizarUnaSerieDeComandos: 'f'.
	self assert: primerMarsRover posicion = (0 @ 1).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:06:06'!
test03
	primerMarsRover realizarUnaSerieDeComandos: ''.
	self assert: primerMarsRover posicion = (0 @ 0).! !

!MarsRoverTest methodsFor: 'as yet unclassified'!
test04
	self
		afirmarUnaOrientacion: #Oeste
		despuesDeUnComando: 'l'.
	self
		afirmarUnaOrientacion: #Sur
		despuesDeUnComando: 'l'.
	self
		afirmarUnaOrientacion: #Este
		despuesDeUnComando: 'l'.
	self
		afirmarUnaOrientacion: #Norte
		despuesDeUnComando: 'l'.! !

!MarsRoverTest methodsFor: 'as yet unclassified'!
test05
	self
		afirmarUnaOrientacion: #Este
		despuesDeUnComando: 'r'.
	self
		afirmarUnaOrientacion: #Sur
		despuesDeUnComando: 'r'.
	self
		afirmarUnaOrientacion: #Oeste
		despuesDeUnComando: 'r'.
	self
		afirmarUnaOrientacion: #Norte
		despuesDeUnComando: 'r'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:06:06'!
test06
	primerMarsRover realizarUnaSerieDeComandos: 'f'.
	primerMarsRover realizarUnaSerieDeComandos: 'l'.
	primerMarsRover realizarUnaSerieDeComandos: 'b'.
	primerMarsRover realizarUnaSerieDeComandos: 'l'.
	segundoMarsRover realizarUnaSerieDeComandos: 'flbl'.
	self assert: (primerMarsRover posicion = segundoMarsRover posicion and: primerMarsRover posicion = (1 @ 1)).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:06:06'!
test07
	self
		afirmarQueUnBloque: [ primerMarsRover realizarUnaSerieDeComandos: 1 ]
		FalleConUnMarsRoverError: MarsRover comandoNecesitaSerUnStringErrorDescription.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:06:06'!
test08
	self
		afirmarQueUnBloque: [ primerMarsRover realizarUnaSerieDeComandos: 'ffabb' ]
		FalleConUnMarsRoverError: MarsRover comandoErroneoEncontradoErrorDescription.
	self assert: primerMarsRover posicion = (0 @ 2).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:52:07'!
test09
	self assert: marsRoverOrientadoHaciaElSur posicion = (0 @ 0).
	self assert: (marsRoverOrientadoHaciaElSur orientacion esIgualA: #Sur).! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'movimiento'!
orientacion
	^ orientacion.! !

!MarsRover methodsFor: 'movimiento'!
posicion
	^ posicion.! !

!MarsRover methodsFor: 'movimiento' stamp: 'FH 5/29/2022 16:06:06'!
realizarUnaSerieDeComandos: comandos
	| movimiento |
	comandos isString not ifTrue: [ self error: MarsRover comandoNecesitaSerUnStringErrorDescription ].
	comandos do: [ :comando |
		(self esValidoElComando: comando) not ifTrue: [ self error: MarsRover comandoErroneoEncontradoErrorDescription ].
		movimiento _ Movimiento
			ConUnMarsRover: self
			yUnComando: comando.
		orientacion _ orientacion serCambiadaPorUnMovimiento: movimiento.
		posicion _ orientacion orientarUnMovimiento: movimiento ].! !


!MarsRover methodsFor: 'privado' stamp: 'FH 5/29/2022 15:31:15'!
esValidoElComando: comando
	(comando = $f
		or: comando = $b
		or: comando = $l
		or: comando = $r) ifTrue: [ ^ true ].
	^ false.! !


!MarsRover methodsFor: 'inicializacion' stamp: 'FH 5/29/2022 15:49:42'!
conOrientacionInicial: unaOrientacion
	posicion _ (0@0).
	orientacion _ Orientacion ConUnaOrientacion: unaOrientacion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'error handling'!
comandoErroneoEncontradoErrorDescription
	^ 'Se encontro un comando erroneo,	los comandos deben ser 
	f (adelante), b (atras), l (girar hacia la izquierda), r (girar hacia la derecha)'.! !

!MarsRover class methodsFor: 'error handling'!
comandoNecesitaSerUnStringErrorDescription
	^ 'El comando de Mars Rover necesita ser en formato de String'.! !


!MarsRover class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:49:49'!
conUnaOrientacionInicial: unaOrientacion
	^self new conOrientacionInicial: unaOrientacion. ! !


!classDefinition: #Movimiento category: 'MarsRover'!
Object subclass: #Movimiento
	instanceVariableNames: 'marsRover orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Movimiento methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeEste
	^ Este new.! !

!Movimiento methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeNorte
	^ Norte new.! !

!Movimiento methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeOeste
	^ Oeste new.! !

!Movimiento methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeSur
	^ Sur new.! !


!Movimiento methodsFor: 'moverse'!
conOrientacionHaciaEste
	^ marsRover posicion.! !

!Movimiento methodsFor: 'moverse'!
conOrientacionHaciaNorte
	^ marsRover posicion.! !

!Movimiento methodsFor: 'moverse'!
conOrientacionHaciaOeste
	^ marsRover posicion.! !

!Movimiento methodsFor: 'moverse'!
conOrientacionHaciaSur
	^ marsRover posicion.! !


!Movimiento methodsFor: 'inicializacion' stamp: 'FH 5/29/2022 15:33:04'!
conUnMarsRover: unMarsRover
	marsRover _ unMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Movimiento class' category: 'MarsRover'!
Movimiento class
	instanceVariableNames: ''!

!Movimiento class methodsFor: 'creacion de instancia' stamp: 'FH 5/29/2022 16:04:18'!
ConUnMarsRover: unMarsRover yUnComando: comando
	| movimientoEncontrado |
	movimientoEncontrado _ Movimiento subclasses detect: [ :subclase |
		subclase IncluyeAUnComando: comando ].
	^ movimientoEncontrado new conUnMarsRover: unMarsRover.! !


!classDefinition: #Adelante category: 'MarsRover'!
Movimiento subclass: #Adelante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Adelante methodsFor: 'moverse' stamp: 'FH 5/29/2022 16:00:39'!
conOrientacionHaciaEste
	^ marsRover posicion + (1 @ 0).! !

!Adelante methodsFor: 'moverse'!
conOrientacionHaciaNorte
	^ marsRover posicion + (0 @ 1).! !

!Adelante methodsFor: 'moverse' stamp: 'FH 5/29/2022 16:00:59'!
conOrientacionHaciaOeste
	^ marsRover posicion + (-1 @ 0).! !

!Adelante methodsFor: 'moverse'!
conOrientacionHaciaSur
	^ marsRover posicion + (0 @ -1).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Adelante class' category: 'MarsRover'!
Adelante class
	instanceVariableNames: ''!

!Adelante class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:04:18'!
IncluyeAUnComando: unComando
	^ unComando = $f.! !


!classDefinition: #Atras category: 'MarsRover'!
Movimiento subclass: #Atras
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Atras methodsFor: 'moverse'!
conOrientacionHaciaEste
	^ marsRover posicion + (-1 @ 0).! !

!Atras methodsFor: 'moverse'!
conOrientacionHaciaNorte
	^ marsRover posicion + (0 @ -1).! !

!Atras methodsFor: 'moverse'!
conOrientacionHaciaOeste
	^ marsRover posicion + (1 @ 0).! !

!Atras methodsFor: 'moverse'!
conOrientacionHaciaSur
	^ marsRover posicion + (0 @ 1).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Atras class' category: 'MarsRover'!
Atras class
	instanceVariableNames: ''!

!Atras class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:04:18'!
IncluyeAUnComando: unComando
	^ unComando = $b.! !


!classDefinition: #GirarDerecha category: 'MarsRover'!
Movimiento subclass: #GirarDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!GirarDerecha methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeEste
	^ Sur new.! !

!GirarDerecha methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeNorte
	^ Este new.! !

!GirarDerecha methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeOeste
	^ Norte new.! !

!GirarDerecha methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeSur
	^ Oeste new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GirarDerecha class' category: 'MarsRover'!
GirarDerecha class
	instanceVariableNames: ''!

!GirarDerecha class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:04:18'!
IncluyeAUnComando: unComando
	^ unComando = $r.! !


!classDefinition: #GirarIzquierda category: 'MarsRover'!
Movimiento subclass: #GirarIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!GirarIzquierda methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeEste
	^ Norte new.! !

!GirarIzquierda methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeNorte
	^ Oeste new.! !

!GirarIzquierda methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeOeste
	^ Sur new.! !

!GirarIzquierda methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeSur
	^ Este new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GirarIzquierda class' category: 'MarsRover'!
GirarIzquierda class
	instanceVariableNames: ''!

!GirarIzquierda class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:04:18'!
IncluyeAUnComando: unComando
	^ unComando = $l.! !


!classDefinition: #Orientacion category: 'MarsRover'!
Object subclass: #Orientacion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Orientacion methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:54:37'!
esIgualA: unaOrientacion
	self subclassResponsibility.! !

!Orientacion methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:00:14'!
orientarUnMovimiento: unMovimiento
	self subclassResponsibility.! !

!Orientacion methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orientacion class' category: 'MarsRover'!
Orientacion class
	instanceVariableNames: ''!

!Orientacion class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:43:56'!
ConUnaOrientacion: unaOrientacion
	| subclaseEncontrada |
	subclaseEncontrada _ Orientacion subclasses detect: [ :subclase |
	subclase esDeEstaOrientacion: unaOrientacion ].
	^ subclaseEncontrada new.! !


!classDefinition: #Este category: 'MarsRover'!
Orientacion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:36:07'!
esIgualA: unaOrientacion
	unaOrientacion = #Este ifTrue: [ ^ true ].
	^ false.! !

!Este methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:00:14'!
orientarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	^ unMovimiento cambiarOrientacionDesdeEste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'MarsRover'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:45:01'!
esDeEstaOrientacion: unaOrientacion
	^ #Este = unaOrientacion.! !


!classDefinition: #Norte category: 'MarsRover'!
Orientacion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:36:12'!
esIgualA: unaOrientacion
	unaOrientacion = #Norte ifTrue: [ ^ true ].
	^ false.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:00:14'!
orientarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	^ unMovimiento cambiarOrientacionDesdeNorte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'MarsRover'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:45:12'!
esDeEstaOrientacion: unaOrientacion
	^ #Norte = unaOrientacion.! !


!classDefinition: #Oeste category: 'MarsRover'!
Orientacion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:36:18'!
esIgualA: unaOrientacion
	unaOrientacion = #Oeste ifTrue: [ ^ true ].
	^ false.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:00:14'!
orientarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	^ unMovimiento cambiarOrientacionDesdeOeste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'MarsRover'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:45:21'!
esDeEstaOrientacion: unaOrientacion
	^ #Oeste = unaOrientacion.! !


!classDefinition: #Sur category: 'MarsRover'!
Orientacion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:36:23'!
esIgualA: unaOrientacion
	unaOrientacion = #Sur ifTrue: [ ^ true ].
	^ false.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 16:00:14'!
orientarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	^ unMovimiento cambiarOrientacionDesdeSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:45:30'!
esDeEstaOrientacion: unaOrientacion
	^ #Sur = unaOrientacion.! !
