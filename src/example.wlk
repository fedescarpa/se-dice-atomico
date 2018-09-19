
object springfield {
	
	var property velocidadDelViento = 20
	var property riquezaDelSuelo = 0.9
	
}

object burns {
	
	var cantidadVarillas = 10
	
	method produccionEnergetica(ciudad) {
		return 0.1 * cantidadVarillas
	}
	
}

object exBosque {
	
	var capacidad = 20
	
	method produccionEnergetica(ciudad) {
		return 0.5 + capacidad * ciudad.riquezaDelSuelo()
	}
	
}

object elSuspiro {
	
	var turbinas = [unaTurbinaPiola]
	
	method produccionEnergetica(ciudad) {
		return turbinas.sum({ turbina => turbina.produccionEnergetica(ciudad) })
	}
	
}

object unaTurbinaPiola {
	
	method produccionEnergetica(ciudad) {
		return 0.2 * ciudad.velocidadDelViento()
	}	
	
}