import artefactosMagicos.*
import enemigos.*

object rolando {
    const mochila = []
    const historialArtefactos = []
    var property capacidadMáximaMochila = 2 // puede llevar hasta 2 artefactos a la vez
    const casa = castilloDePiedra
    var property poderBase = 5

    //const enemigos = #{}

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
        return casa.artefactoMásPoderoso(self)
    }

    method pelearBatalla() {
        self.usarArtefactosDeMochila()
        poderBase += 1
    }

    method usarArtefactosDeMochila() {
        return mochila.forEach( {artefacto => artefacto.serUsado()} )
    }

    method puedeVencerALosEnemigos(enemigos) {
        return enemigos.filter( {enemigo => enemigo.poderDePelea() < self.poderDePelea()} )
    }

    //A su vez, las moradas que Rolando podría conquistar son las moradas de los enemigos a los cuales puede vencer.
    method puedeConquistarCasaDeLosEnemigos(enemigos) {
        // saber a quienes puedo vencer y a cada enemigo pedirle su morada
        return self.puedeVencerALosEnemigos(enemigos).map( {enemigo => enemigo.casa()} )
    }

    method esPoderosoContra(enemigos) {
        return enemigos.all( { enemigo => enemigo.poderDePelea() < self.poderDePelea()} )
    }

    method poseeArtefactoFatalPara(enemigo) {
        return mochila.any( { artefacto => artefacto.poderQueAportaPara(self) > enemigo.poderDePelea() } )
    }
}

object castilloDePiedra {
    const inventario = []

    method inventario() = inventario

    method depositar(artefactos){ 
        inventario.addAll(artefactos)
    }
    
    method inventarioVacío() = inventario.isEmpty()

    method artefactoMásPoderoso(personaje) {
        return inventario.max( { artefacto => artefacto.poderQueAportaPara(personaje) })
    }
}