import artefactosMagicos.*
import enemigos.*

object rolando {
    const mochila = []
    const historialArtefactos = []
    var property capacidadMáximaMochila = 2 // puede llevar hasta 2 artefactos a la vez
    const casa = castilloDePiedra

    // parte 2.1
    var property poderBase = 5

    method mochila() = mochila
    method historialArtefactos() = historialArtefactos
    method casa() = casa

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
    }

    method poderTotalArtefactos() {
        return mochila.sum( {artefacto => artefacto.poderQueAportaPara(self)} )
    }

    // el artefacto que me de mas poder
    method poderInvocado() {
        return casa.inventario().max( { artefacto => artefacto.poderQueAportaPara(self) })
    }

    method pelearBatalla() {
        self.usarArtefactosDeMochila()
        poderBase += 1
    }

    method usarArtefactosDeMochila() {
        return mochila.forEach( {artefacto => artefacto.serUsado()} )
    }

    method puedeVencer(enemigo) {
        // Los enemigos en Erethia que Rolando puede vencer son aquellos que tienen un poder de batalla menor al suyo.
        // enemigo.poderDePelea() < self.poderDePelea()
    }

    //A su vez, las moradas que Rolando podría conquistar son las moradas de los enemigos a los cuales puede vencer.
    method puedeConquistarCasaDelEnemigo(enemigo) {
        
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