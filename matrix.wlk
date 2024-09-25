object nave {
    const property pasajeros = [neo,morfeo,trinity]

    method subirPasajero(unPasajero) {
      pasajeros.add(unPasajero)
    }

    method bajarPasajero(unPasajero) {
      pasajeros.remove(unPasajero)
    }
    
    method cantidadDePasajeros() {
       return pasajeros.size()
    }

    method pasajeroConMasVitalidad() {
      return pasajeros.max({p => p.vitalidad()})
    }

    method pasajeroConMenosVitalidad() {
      return pasajeros.min({p => p.vitalidad()})
    }

    method hayUnaVitalidadEquilibrada() {
      return
      self.pasajeroConMasVitalidad().vitalidad() <=
      self.pasajeroConMenosVitalidad().vitalidad() * 2
    }

    method estaElElegido() {
      return pasajeros.any({p => p.esElElegido()})
    }

    method chocar() {
      pasajeros.forEach({p => p.saltar() self.bajarPasajero(p)})
    }

    method acelerar() {
       self.pasajerosSinElElegido().forEach({p => p.saltar()})
    }

    method pasajerosSinElElegido() {
       return pasajeros.filter({p => not p.esElElegido()})
    }
}

object neo {
    var energia = 100
  
    method esElElegido() = true

    method saltar() {
      energia = energia * 0.5
    }

    method vitalidad() = energia % 10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method vitalidad() = vitalidad

    method esElElegido() = false

    method estaCansado() = estaCansado

    method saltar() {
      vitalidad = 0.max(vitalidad - 1)
      estaCansado = not estaCansado
    }
}

object trinity {
    
    method vitalidad() = 0

    method esElElegido() = false

    method saltar() {}
}