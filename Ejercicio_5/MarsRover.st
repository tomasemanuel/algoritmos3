!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'primerMarsRoverOrientadoHaciaElNorte segundoMarsRoverOrientadoHaciaElNorte marsRoverOrientadoHaciaElSur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:33:21'!
test01NoSeMueveCuandoSeLeEnviaUnComandoVacio
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeMovimiento:'' ySeAfirmaLaNuevaPosicion:(0 @ 0).
	"primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: ''.
	self assert: primerMarsRoverOrientadoHaciaElNorte posicion = (0 @ 0)."! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:33:21'!
test02SeMueveCorrectamenteParaAdelanteEnOrientacionNorte
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeMovimiento:'f' ySeAfirmaLaNuevaPosicion:(0 @ 1).
	
	"primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'f'.
	self assert: primerMarsRoverOrientadoHaciaElNorte posicion = (0 @ 1)."! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:33:21'!
test03SeMueveCorrectamenteEnviandoVariosComandos
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeMovimiento:'fflflb' ySeAfirmaLaNuevaPosicion:(-1 @ 3).! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:32:36'!
test04EnviarVariosComandosPorSeparadoEsLoMismoQueMandarTodosJuntos
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'f'.
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'b'.
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	segundoMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'flbl'.
	self assert: (primerMarsRoverOrientadoHaciaElNorte posicion = segundoMarsRoverOrientadoHaciaElNorte posicion and: primerMarsRoverOrientadoHaciaElNorte posicion = (1 @ 1)).! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:33:03'!
test05GirarUnaVezUnMarsRoverDeOrientacionInicialNorteHaciaLaIzquierdaApuntaHaciaOeste
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'l' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlOeste].
	"primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlOeste."
! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:32:57'!
test06CuatroVecesUnMarsRoverDeOrientacionInicialNorteHaciaLaIzquierdaVuelveALaOrientacionInicial
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'l' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlOeste].
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'l' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlSur].
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'l' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlEste].
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'l' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlNorte].
	"primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlOeste.
	
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlSur.
	
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlEste.
	
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'l'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlNorte."! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:32:49'!
test07GirarUnaVezUnMarsRoverDeOrientacionInicialNorteHaciaLaDerechaApuntaHaciaEste
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'r' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlEste].
	
	"primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'r'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlEste."
! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:32:43'!
test08GirarCuatroVecesUnMarsRoverConOrientacionInicialNorteHaciaLaDerechaVuelveALaOrientacionInicial
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'r' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlEste].
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'r' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlSur].
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'r' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlOeste].
	
	self marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:'r' ySeAfirmaLaNuevaOrientacion:[primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlNorte].
	
	"primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'r'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlEste.
	
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'r'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlSur.
	
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'r'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlOeste.
	
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'r'.
	self assert: primerMarsRoverOrientadoHaciaElNorte marsRoverEstaMirandoAlNorte."! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:31:09'!
test09LanzaErrorCuandoNoSeLeMandaUnStringComoComando
	self
		afirmarQueUnBloque: [ primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 1 ]
		FalleConUnMarsRoverError: MarsRover comandoNecesitaSerUnStringErrorDescription.! !

!MarsRoverTest methodsFor: 'testeo' stamp: 'Te 5/31/2022 16:30:55'!
test10SeEjecutaCorrectamenteHastaElCaracterErroneo
	self
		afirmarQueUnBloque: [ primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: 'ffabb' ]
		FalleConUnMarsRoverError: MarsRover comandoErroneoEncontradoErrorDescription.
	self assert: primerMarsRoverOrientadoHaciaElNorte posicion = (0 @ 2).! !


!MarsRoverTest methodsFor: 'setUp' stamp: 'FH 5/30/2022 17:09:58'!
setUp
	primerMarsRoverOrientadoHaciaElNorte _ MarsRover conUnaOrientacionInicial: #Norte.
	segundoMarsRoverOrientadoHaciaElNorte _ MarsRover conUnaOrientacionInicial: #Norte.
	marsRoverOrientadoHaciaElSur _ MarsRover conUnaOrientacionInicial: #Sur.! !


!MarsRoverTest methodsFor: 'privado' stamp: 'FH 5/29/2022 15:32:05'!
afirmarQueUnBloque: unBloque FalleConUnMarsRoverError: unMarsRoverError
	self
		should: unBloque
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = unMarsRoverError ].! !

!MarsRoverTest methodsFor: 'privado' stamp: 'Te 5/31/2022 16:33:21'!
marsRoverOrientadoHaciaElNorteRecibeUnComandoDeMovimiento:unComandoDeMovimiento ySeAfirmaLaNuevaPosicion:NuevaPosicion

	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: unComandoDeMovimiento.
	self assert: primerMarsRoverOrientadoHaciaElNorte posicion = NuevaPosicion.! !

!MarsRoverTest methodsFor: 'privado' stamp: 'Te 5/31/2022 16:24:21'!
marsRoverOrientadoHaciaElNorteRecibeUnComandoDeOrientacion:unComandoDeOrientacion ySeAfirmaLaNuevaOrientacion:BloqueCorrectaOrientacion
	primerMarsRoverOrientadoHaciaElNorte realizarUnaSerieDeComandos: unComandoDeOrientacion.
	self assert: BloqueCorrectaOrientacion value.
	! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'movimiento' stamp: 'FH 5/30/2022 17:07:26'!
realizarUnaSerieDeComandos: comandos
	| movimiento |
	self esValidoLaSerieDeComandos: comandos.
	comandos do: [ :comando |
		self esValidoElComando: comando.
		movimiento _ MovimientoDelMarsRover
			ConUnMarsRover: self
			yUnComando: comando.
		orientacion _ orientacion serCambiadaPorUnMovimiento: movimiento.
		posicion _ orientacion indicarUnMovimiento: movimiento ].! !


!MarsRover methodsFor: 'privado' stamp: 'FH 5/30/2022 17:04:21'!
esValidoElComando: comando
	(comando = $f
		or: comando = $b
		or: comando = $l
		or: comando = $r)not ifTrue: [ self error: MarsRover comandoErroneoEncontradoErrorDescription ].! !

!MarsRover methodsFor: 'privado' stamp: 'FH 5/30/2022 17:07:08'!
esValidoLaSerieDeComandos:comandos

	comandos isString not ifTrue:
		[ self error: MarsRover comandoNecesitaSerUnStringErrorDescription ].! !


!MarsRover methodsFor: 'inicializacion' stamp: 'Te} 5/29/2022 19:49:42'!
conOrientacionInicial: unaOrientacion
	posicion _ (0@0).
	orientacion _ OrientacionDelMarsRover ConUnaOrientacion: unaOrientacion.! !


!MarsRover methodsFor: 'acceso' stamp: 'Te} 5/29/2022 19:06:56'!
marsRoverEstaMirandoAlEste
	^orientacion isKindOf: Este.! !

!MarsRover methodsFor: 'acceso' stamp: 'Te} 5/29/2022 19:06:32'!
marsRoverEstaMirandoAlNorte
	^orientacion isKindOf: Norte.! !

!MarsRover methodsFor: 'acceso' stamp: 'Te} 5/29/2022 19:06:43'!
marsRoverEstaMirandoAlOeste
	^orientacion isKindOf: Oeste.! !

!MarsRover methodsFor: 'acceso' stamp: 'Te} 5/29/2022 19:06:50'!
marsRoverEstaMirandoAlSur
	^orientacion isKindOf: Sur.! !

!MarsRover methodsFor: 'acceso'!
posicion
	^ posicion.! !

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


!classDefinition: #MovimientoDelMarsRover category: 'MarsRover'!
Object subclass: #MovimientoDelMarsRover
	instanceVariableNames: 'marsRover orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MovimientoDelMarsRover methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeEste
	^ Este new.! !

!MovimientoDelMarsRover methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeNorte
	^ Norte new.! !

!MovimientoDelMarsRover methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeOeste
	^ Oeste new.! !

!MovimientoDelMarsRover methodsFor: 'cambiarOrientacion'!
cambiarOrientacionDesdeSur
	^ Sur new.! !


!MovimientoDelMarsRover methodsFor: 'moverse'!
conOrientacionHaciaEste
	^ marsRover posicion.! !

!MovimientoDelMarsRover methodsFor: 'moverse'!
conOrientacionHaciaNorte
	^ marsRover posicion.! !

!MovimientoDelMarsRover methodsFor: 'moverse'!
conOrientacionHaciaOeste
	^ marsRover posicion.! !

!MovimientoDelMarsRover methodsFor: 'moverse'!
conOrientacionHaciaSur
	^ marsRover posicion.! !


!MovimientoDelMarsRover methodsFor: 'inicializacion' stamp: 'FH 5/29/2022 15:33:04'!
conUnMarsRover: unMarsRover
	marsRover _ unMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MovimientoDelMarsRover class' category: 'MarsRover'!
MovimientoDelMarsRover class
	instanceVariableNames: ''!

!MovimientoDelMarsRover class methodsFor: 'creacion de instancia' stamp: 'Te} 5/29/2022 19:49:29'!
ConUnMarsRover: unMarsRover yUnComando: comando
	| movimientoEncontrado |
	movimientoEncontrado _ MovimientoDelMarsRover subclasses detect: [ :subclase |
		subclase IncluyeAUnComando: comando ].
	^ movimientoEncontrado new conUnMarsRover: unMarsRover.! !


!classDefinition: #Adelante category: 'MarsRover'!
MovimientoDelMarsRover subclass: #Adelante
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
MovimientoDelMarsRover subclass: #Atras
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
MovimientoDelMarsRover subclass: #GirarDerecha
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
MovimientoDelMarsRover subclass: #GirarIzquierda
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


!classDefinition: #OrientacionDelMarsRover category: 'MarsRover'!
Object subclass: #OrientacionDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!OrientacionDelMarsRover methodsFor: 'funcionamiento' stamp: 'Te} 5/29/2022 18:30:00'!
indicarUnMovimiento: unMovimiento
	self subclassResponsibility.! !

!OrientacionDelMarsRover methodsFor: 'funcionamiento' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionDelMarsRover class' category: 'MarsRover'!
OrientacionDelMarsRover class
	instanceVariableNames: ''!

!OrientacionDelMarsRover class methodsFor: 'creacionDeInstancia' stamp: 'Te} 5/29/2022 19:49:42'!
ConUnaOrientacion: unaOrientacion
	| subclaseEncontrada |
	subclaseEncontrada _ OrientacionDelMarsRover subclasses detect: [ :subclase |
	subclase esDeEstaOrientacion: unaOrientacion ].
	^ subclaseEncontrada new.! !


!classDefinition: #Este category: 'MarsRover'!
OrientacionDelMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Este methodsFor: 'funcionamiento' stamp: 'Te} 5/29/2022 18:30:00'!
indicarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaEste.! !

!Este methodsFor: 'funcionamiento' stamp: 'FH 5/29/2022 15:56:03'!
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
OrientacionDelMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Norte methodsFor: 'funcionamiento' stamp: 'Te} 5/29/2022 18:30:00'!
indicarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaNorte.! !

!Norte methodsFor: 'funcionamiento' stamp: 'FH 5/29/2022 15:56:03'!
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
OrientacionDelMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Oeste methodsFor: 'funcionamiento' stamp: 'Te} 5/29/2022 18:30:00'!
indicarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaOeste.! !

!Oeste methodsFor: 'funcionamiento' stamp: 'FH 5/29/2022 15:56:03'!
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
OrientacionDelMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Sur methodsFor: 'funcionamiento' stamp: 'Te} 5/29/2022 18:30:00'!
indicarUnMovimiento: unMovimiento
	^ unMovimiento conOrientacionHaciaSur.! !

!Sur methodsFor: 'funcionamiento' stamp: 'FH 5/29/2022 15:56:03'!
serCambiadaPorUnMovimiento: unMovimiento
	^ unMovimiento cambiarOrientacionDesdeSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'FH 5/29/2022 15:45:30'!
esDeEstaOrientacion: unaOrientacion
	^ #Sur = unaOrientacion.! !
