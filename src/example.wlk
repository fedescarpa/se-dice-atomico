
object springfield {
	
	var property velocidadDelViento = 20
	var property riquezaDelSuelo = 0.9
	
	var centrales = #{burns, exBosque, elSuspiro}
	
	method centralesContaminantes() {
		return centrales.filter({ central => central.esContaminante() })
	}
}

object burns {
	
	var cantidadVarillas = 10
	
	method produccionEnergetica(ciudad) {
		return 0.1 * cantidadVarillas
	}
	
	method esContaminante() {
		return cantidadVarillas > 20
	}
	
}

object exBosque {
	
	var capacidad = 20
	
	method produccionEnergetica(ciudad) {
		return 0.5 + capacidad * ciudad.riquezaDelSuelo()
	}
	
	method esContaminante() {
		return true
	}
}

object elSuspiro {
	
	var turbinas = [unaTurbinaPiola]
	
	method produccionEnergetica(ciudad) {
		return turbinas.sum({ turbina => turbina.produccionEnergetica(ciudad) })
	}
	
	method esContaminante() {
		return false
	}
}

object unaTurbinaPiola {
	
	method produccionEnergetica(ciudad) {
		return 0.2 * ciudad.velocidadDelViento()
	}	
	
}