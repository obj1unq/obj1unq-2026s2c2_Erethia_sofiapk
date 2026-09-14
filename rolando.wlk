import artefactosMagicos.*
import enemigos.*
import erethia.*

object rolando {
    const mochila = []
    const historialArtefactos = []
    var property capacidadMáximaMochila = 2 // puede llevar hasta 2 artefactos a la vez
    const casa = castilloDePiedra
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