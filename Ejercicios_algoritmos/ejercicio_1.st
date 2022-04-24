!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeOriana cantidadDeOrugas cantidadDeHuevos cantidadDePolillas cantidadDeHuevosDePolly cantidadDeHuevosDeLara'!



!HabitatDeAvispas class methodsFor: 'retrocederElHabitatAlInicioDeLosTiempos' stamp: 'Te 4/23/2022 17:31:05'!
retrocederElHabitatAlInicioDeLosTiempos
	cantidadDeHuevos := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosDeOriana := 0.
	cantidadDeHuevosDePolly := 0.
	cantidadDeHuevosDeLara := 0.
	! !


!HabitatDeAvispas class methodsFor: 'CantidadDeOrugasYDePolillas' stamp: 'Te 4/23/2022 17:55:50'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeOrugasYDePolillas' stamp: 'Te 4/23/2022 15:46:55'!
cantidadDePolillas
	^cantidadDePolillas! !


!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/23/2022 17:32:39'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^cantidadDeHuevosDeLara.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/23/2022 15:52:21'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^cantidadDeHuevosDeOriana.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/23/2022 16:00:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevosDePolly.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/21/2022 19:57:14'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevos! !


!HabitatDeAvispas class methodsFor: 'ManejoDePolillas' stamp: 'Te 4/23/2022 15:35:13'!
DecrementarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDePolillas' stamp: 'Te 4/23/2022 15:38:22'!
IncrementarUnaPolilla
	cantidadDePolillas := cantidadDePolillas +1! !


!HabitatDeAvispas class methodsFor: 'ManejoDeOrugas' stamp: 'Te 4/23/2022 15:19:15'!
DecrementarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDeOrugas' stamp: 'Te 4/21/2022 20:16:45'!
IncrementarUnaOruga
	cantidadDeOrugas:= cantidadDeOrugas+1.! !


!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/23/2022 16:23:38'!
DecrementarHuevoDeOriana
	cantidadDeHuevosDeOriana := 	cantidadDeHuevosDeOriana -1! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/23/2022 17:10:01'!
DecrementarHuevoDePolly
	cantidadDeHuevosDePolly := 	cantidadDeHuevosDePolly -1! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/23/2022 16:24:23'!
IncrementarHuevoDeLara
	cantidadDeHuevosDeLara := 	cantidadDeHuevosDeLara + 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/21/2022 20:11:06'!
IncrementarUnHuevo
	cantidadDeHuevos := cantidadDeHuevos + 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/23/2022 15:56:14'!
IncrementarUnHuevoDeOriana
	cantidadDeHuevosDeOriana := cantidadDeHuevosDeOriana + 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/23/2022 16:00:41'!
IncrementarUnHuevoDePolly
	cantidadDeHuevosDePolly := cantidadDeHuevosDePolly + 1.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'Te 4/24/2022 15:58:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeOriana := 0.
	cantidadDeOrugas := 0.
	cantidadDeHuevos := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosDePolly := 0.
	cantidadDeHuevosDeLara := 0.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/23/2022 15:21:55'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/23/2022 17:55:50'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/23/2022 17:55:50'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Te 4/23/2022 17:55:50'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/23/2022 16:13:08'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/23/2022 16:13:08'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/23/2022 16:13:08'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/23/2022 16:13:08'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 17:32:00'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:57:16'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 16:08:10'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self cantidadDeHuevosConLaFirmaGeneticaDeOriana ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 16:01:48'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/21/2022 19:46:26'!
habitat
	^HabitatDeAvispas! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:37:01'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas.
	self queElHabitatTengaDosPolillasMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 17:07:06'!
laAvispaLara
	^laAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/21/2022 19:55:00'!
laAvispaOriana
	^laAvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:26:25'!
laAvispaOrnella
	^laAvispaOrnella	.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:43:45'!
laAvispaPolly
	^laAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:40:56'!
queElHabitatTengaDosOrugasMas
	2 timesRepeat: [self queElHabitatTengaUnaOrugaMas ].
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:40:07'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat: [self queElHabitatTengaUnaPolillaMas ].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/21/2022 20:15:01'!
queElHabitatTengaUnaOrugaMas
	self habitat IncrementarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:40:33'!
queElHabitatTengaUnaPolillaMas
	self habitat IncrementarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/21/2022 20:06:50'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederElHabitatAlInicioDeLosTiempos.! !


!classDefinition: #laAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaLara class' category: 'AvispasYAbejasParte2'!
laAvispaLara class
	instanceVariableNames: ''!

!laAvispaLara class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:47:56'!
ReproduccionConHuevoDeFirmaOriana
	HabitatDeAvispas DecrementarHuevoDeOriana.
	 HabitatDeAvispas IncrementarHuevoDeLara! !

!laAvispaLara class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:49:30'!
ReproduccionConHuevoDeFirmaPolly
	HabitatDeAvispas DecrementarHuevoDePolly.
	HabitatDeAvispas IncrementarHuevoDeLara.! !

!laAvispaLara class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:48:28'!
intentarReproducirse
	HabitatDeAvispas cantidadDeHuevosConLaFirmaGeneticaDeOriana > 0 ifTrue: 
		[self ReproduccionConHuevoDeFirmaOriana ] 
	ifFalse:
		[ HabitatDeAvispas cantidadDeHuevosConLaFirmaGeneticaDePolly > 0 ifTrue:[
			self ReproduccionConHuevoDeFirmaPolly]]
	! !


!classDefinition: #laAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaOriana class' category: 'AvispasYAbejasParte2'!
laAvispaOriana class
	instanceVariableNames: ''!

!laAvispaOriana class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:46:36'!
Reproduccion 
	HabitatDeAvispas DecrementarUnaOruga.
	HabitatDeAvispas IncrementarUnHuevo. 
	HabitatDeAvispas IncrementarUnHuevoDeOriana.! !

!laAvispaOriana class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:55:50'!
intentarReproducirse
	HabitatDeAvispas cantidadDeOrugas > 0 ifTrue: [self Reproduccion.]! !


!classDefinition: #laAvispaOrnella category: 'AvispasYAbejasParte2'!
laAvispaOriana subclass: #laAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #laAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaPolly class' category: 'AvispasYAbejasParte2'!
laAvispaPolly class
	instanceVariableNames: ''!

!laAvispaPolly class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:45:58'!
Reproduccion
	HabitatDeAvispas DecrementarUnaPolilla. 
	HabitatDeAvispas IncrementarUnHuevo.
	HabitatDeAvispas  IncrementarUnHuevoDePolly .! !

!laAvispaPolly class methodsFor: 'Reproduccion' stamp: 'Te 4/23/2022 17:45:26'!
intentarReproducirse
	HabitatDeAvispas cantidadDePolillas > 0 ifTrue: 
		[self Reproduccion.]! !

HabitatDeAvispas initializeAfterFileIn!