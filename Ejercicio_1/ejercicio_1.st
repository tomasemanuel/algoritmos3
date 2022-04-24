!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeOrianaYOrnella cantidadDeOrugas cantidadDeHuevos cantidadDePolillas cantidadDeHuevosDePolly cantidadDeHuevosDeLara'!

!HabitatDeAvispas class methodsFor: 'retrocederElHabitatAlInicioDeLosTiempos' stamp: 'Te 4/24/2022 18:47:48'!
retrocederElHabitatAlInicioDeLosTiempos
	cantidadDeHuevos := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosDeOrianaYOrnella := 0.
	cantidadDeHuevosDePolly := 0.
	cantidadDeHuevosDeLara := 0.! !


!HabitatDeAvispas class methodsFor: 'CantidadDeOrugasYDePolillas' stamp: 'Te 4/23/2022 17:55:50'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeOrugasYDePolillas' stamp: 'Te 4/23/2022 15:46:55'!
cantidadDePolillas
	^cantidadDePolillas! !


!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/23/2022 17:32:39'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^cantidadDeHuevosDeLara.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/24/2022 18:49:37'!
cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella
	^cantidadDeHuevosDeOrianaYOrnella .! !

!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/23/2022 16:00:09'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevosDePolly.! !

!HabitatDeAvispas class methodsFor: 'CantidadDeHuevos' stamp: 'Te 4/24/2022 18:05:02'!
cantidadDeHuevosDeAvispas
		^self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella  + self cantidadDeHuevosConLaFirmaGeneticaDePolly  + self cantidadDeHuevosConLaFirmaGeneticaDeLara.! !


!HabitatDeAvispas class methodsFor: 'ManejoDePolillas' stamp: 'Te 4/24/2022 18:21:43'!
agregarUnaPolilla
	cantidadDePolillas := cantidadDePolillas +1! !

!HabitatDeAvispas class methodsFor: 'ManejoDePolillas' stamp: 'Te 4/24/2022 18:21:30'!
consumirUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !


!HabitatDeAvispas class methodsFor: 'Orugas' stamp: 'Te 4/24/2022 18:20:45'!
agregarUnaOruga
	cantidadDeOrugas:= cantidadDeOrugas+1.! !

!HabitatDeAvispas class methodsFor: 'Orugas' stamp: 'Te 4/24/2022 18:20:57'!
consumirUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !


!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/24/2022 18:52:19'!
consumirHuevoDeOriana
	cantidadDeHuevosDeOrianaYOrnella := 	cantidadDeHuevosDeOrianaYOrnella -1! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/24/2022 18:32:05'!
consumirHuevoDePolly
	cantidadDeHuevosDePolly := 	cantidadDeHuevosDePolly -1! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/24/2022 18:36:42'!
ponerHuevoDeLara
	cantidadDeHuevosDeLara := 	cantidadDeHuevosDeLara + 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/24/2022 18:44:07'!
ponerUnHuevoDeOriana
	cantidadDeHuevosDeOrianaYOrnella := cantidadDeHuevosDeOrianaYOrnella + 1.! !

!HabitatDeAvispas class methodsFor: 'ManejoDeHuevos' stamp: 'Te 4/24/2022 18:41:00'!
ponerUnHuevoDePolly
	cantidadDeHuevosDePolly := cantidadDeHuevosDePolly + 1.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'Te 4/24/2022 18:58:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeOrianaYOrnella := 1.
	cantidadDeOrugas := 1.
	cantidadDeHuevos := 0.
	cantidadDePolillas := 2.
	cantidadDeHuevosDePolly := 0.
	cantidadDeHuevosDeLara := 0.! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: ''!

!LaAvispaLara class methodsFor: 'Reproduccion' stamp: 'Te 4/24/2022 18:55:20'!
intentarReproducirse
	HabitatDeAvispas cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella > 0 ifTrue: 
		[self reproduccionConHuevoDeFirmaOriana ] 
	ifFalse:
		[ HabitatDeAvispas cantidadDeHuevosConLaFirmaGeneticaDePolly > 0 ifTrue:[
			self reproduccionConHuevoDeFirmaPolly]]
	! !

!LaAvispaLara class methodsFor: 'Reproduccion' stamp: 'Te 4/24/2022 18:55:20'!
reproduccionConHuevoDeFirmaOriana
	HabitatDeAvispas consumirHuevoDeOriana.
	HabitatDeAvispas ponerHuevoDeLara! !

!LaAvispaLara class methodsFor: 'Reproduccion' stamp: 'Te 4/24/2022 18:55:11'!
reproduccionConHuevoDeFirmaPolly
	HabitatDeAvispas consumirHuevoDePolly.
	HabitatDeAvispas ponerHuevoDeLara.! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: ''!

!LaAvispaOriana class methodsFor: 'Reproduccion' stamp: 'Te 4/24/2022 18:09:13'!
intentarReproducirse
	self alimento > 0 ifTrue: [self reproduccion.]! !

!LaAvispaOriana class methodsFor: 'Reproduccion' stamp: 'Te 4/24/2022 18:47:05'!
reproduccion
	self consumirAlimento. 
	self ponerUnHuevo.! !


!LaAvispaOriana class methodsFor: 'as yet unclassified' stamp: 'Te 4/24/2022 18:08:51'!
alimento
	^HabitatDeAvispas cantidadDeOrugas.! !

!LaAvispaOriana class methodsFor: 'as yet unclassified' stamp: 'Te 4/24/2022 18:24:12'!
consumirAlimento
	HabitatDeAvispas consumirUnaOruga.! !

!LaAvispaOriana class methodsFor: 'as yet unclassified' stamp: 'Te 4/24/2022 18:44:49'!
ponerUnHuevo
	HabitatDeAvispas ponerUnHuevoDeOriana .! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
LaAvispaOriana subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
LaAvispaOriana subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: ''!

!LaAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'Te 4/24/2022 18:45:06'!
alimento
	^HabitatDeAvispas cantidadDePolillas.! !

!LaAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'Te 4/24/2022 18:45:06'!
consumirAlimento
	HabitatDeAvispas consumirUnaPolilla .! !

!LaAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'Te 4/24/2022 18:45:36'!
ponerUnHuevo
	HabitatDeAvispas ponerUnHuevoDePolly.! !


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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/24/2022 17:52:24'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/24/2022 17:52:24'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/24/2022 17:52:24'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/24/2022 17:52:24'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'Te 4/24/2022 17:52:24'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Te 4/24/2022 17:52:56'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Te 4/24/2022 17:52:56'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'Te 4/24/2022 17:52:56'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Te 4/24/2022 17:52:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Te 4/24/2022 17:52:46'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Te 4/24/2022 17:52:46'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'Te 4/24/2022 17:52:46'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'Te 4/24/2022 18:03:31'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'Te 4/24/2022 18:03:31'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'Te 4/24/2022 18:03:31'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'Te 4/24/2022 18:03:31'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/24/2022 17:52:56'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/24/2022 18:03:31'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/24/2022 17:52:46'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'Te 4/24/2022 17:52:13'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 17:32:00'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 18:03:31'!
cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 18:03:31'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella ! !

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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 17:52:13'!
laAvispaLara
	^LaAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 17:52:24'!
laAvispaOriana
	^LaAvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 17:52:56'!
laAvispaOrnella
	^LaAvispaOrnella	.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 18:46:10'!
laAvispaPolly
	^LaAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:40:56'!
queElHabitatTengaDosOrugasMas
	2 timesRepeat: [self queElHabitatTengaUnaOrugaMas ].
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/23/2022 15:40:07'!
queElHabitatTengaDosPolillasMas
	2 timesRepeat: [self queElHabitatTengaUnaPolillaMas ].! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 18:20:45'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarUnaOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/24/2022 18:21:43'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarUnaPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'Te 4/21/2022 20:06:50'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederElHabitatAlInicioDeLosTiempos.! !

HabitatDeAvispas initializeAfterFileIn!