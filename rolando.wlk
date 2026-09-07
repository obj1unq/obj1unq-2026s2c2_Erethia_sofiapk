import artefactosMagicos.*
object rolando {
    const mochila = []
    const historialArtefactos = []
    var property capacidadMáximaMochila = 2 // puede llevar hasta 2 artefactos a la vez
    const casa = castilloDePiedra

    // parte 2.1
    var property poderBase = 5

    method mochila() = mochila
    method historialArtefactos() = historialArtefactos

    method encontrar(artefacto) {
        historialArtefactos.add(artefacto)
        self.guardar(artefacto)
    }

    method guardar(artefacto) {
        if ( mochila.size() < capacidadMáximaMochila ){
            mochila.add(artefacto)
        }
    }

    method llegarACasa() {
        casa.depositar(mochila)
        mochila.clear()
    }
    
    // Saber las posesiones de Rolando
    method posesiones() = self.mochila() + casa.inventario()

    // Saber si Rolando posee un artefacto en particular
    method posee(artefacto) = self.posesiones().contains(artefacto)

    // parte 2.1
    method poderDePelea() {
        return poderBase + self.poderTotalArtefactos()
        /* + sumatoria de los poderes de pelea de los artefactos de la mochila */
    }

    method poderTotalArtefactos() {
        return mochila.sum( {artefacto => artefacto.poderQueAportaPara(self)} )
    }

    method pelearBatalla() {
      // Cuando ocurre una batalla, se utilizan todos los artefactos que rolando lleva consigo, y además se incrementa en 1 el número base del poder de pelea de rolando.

    }
}

object castilloDePiedra {
    const inventario = []

    method inventario() = inventario

    method depositar(artefactos){ 
        inventario.addAll(artefactos)
    }
    
    method inventarioVacío() = inventario.isEmpty()
}