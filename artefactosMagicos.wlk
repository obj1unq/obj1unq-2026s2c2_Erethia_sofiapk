import rolando.*
import enemigos.*

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
        esPrimeraBatalla = false
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

    method serUsado() {} // esta bien que esté vacío
}

object libroDeHechizos {
    const hechizos = [bendición, invisibilidad, invocación]

    method hechizos() = hechizos

    method poderQueAportaPara(personaje)  {
        return
            if ( ! hechizos.isEmpty() ){
                hechizos.get(0).poderQueAportaPara(personaje)
            } else {
                0 // Si el libro de hechizos no tiene ningún hechizo, entonces su aporte es nulo.
            }
    }

    method serUsado() { // no lleva return porque es una orden !!
        if ( ! hechizos.isEmpty() ){
            hechizos.remove(hechizos.get(0))
        }       
    }
}

object bendición {
    method poderQueAportaPara(personaje) = 4
}

object invocación {
    method poderQueAportaPara(personaje){
        // return personaje.casa().inventario().max( { artefacto => artefacto.poderQueAportaPara(personaje) }).poderQueAportaPara(personaje) // mal - robo responsabilidad
        return personaje.poderInvocado().poderQueAportaPara(personaje)
    }
}

object invisibilidad {
    method poderQueAportaPara(personaje) = personaje.poderBase()
}