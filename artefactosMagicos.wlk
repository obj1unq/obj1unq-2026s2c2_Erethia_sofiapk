import rolando.*

// ARTEFACTOS MAGICOS
object espadaDelDestino {
    var esPrimeraBatalla = true

    method poderQueAportaPara(personaje) {
        return
            if ( not self.esPrimeraBatalla() ) {
                personaje.poderBase() / 2
            } else {
                personaje.poderBase()
            } 
    }

    method esPrimeraBatalla() = esPrimeraBatalla

    method serUsado() {
      
    }
}

object libroDeHechizos {
    method poderQueAportaPara(personaje)  {
        return
    }

    method serUsado() {
      
    }
}

object collarDivino {
    var usos = 0 //contador

    method poderQueAportaPara(personaje)  {
        return
            if (personaje.poderBase() > 6) {
                3 + usos
            } else { 
                3
            }
    }
    
    method serUsado() {
        usos += 1
    }
}

object armaduraDeAceroValyrio {
    method poderQueAportaPara(personaje) = 6
}