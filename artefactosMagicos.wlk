import rolando.*

// ARTEFACTOS MAGICOS
object espadaDelDestino {
    method poderQueAportaPara(personaje) {
        return
        if ( self.esPrimeraBatalla() ) {
            personaje.poderBase()
        } else {
            personaje.poderBase() / 2
        } 
    }

    method esPrimeraBatalla() = true
}

object libroDeHechizos {
    method poderQueAportaPara(personaje)  {
        return
    }
}

object collarDivino {
    method poderQueAportaPara(personaje)  {
        var cantidadDeUsos = 0 // contador

        return
        if (personaje.poderBase() > 6) {
            3 + personaje.cantidadBatallas()
        } else { 
            3
        }
    }
    /* Collar divino: aporta 3 puntos, pero si el personaje tiene un poder base mayor a 6,
    le suma también un punto por cada batalla en la que se haya usado el collar.*/
    
}

object armaduraDeAceroValyrio {
    method poderQueAportaPara(personaje)  {
        return 6
    }  
}