import artefactosMagicos.*
object rolando {
    const mochila = []
    const historialArtefactos = []
    var property capacidadMáximaMochila = 2 // puede llevar hasta 2 artefactos a la vez
    const casa = castilloDePiedra

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
}

object castilloDePiedra {
    const inventario = []

    method inventario() = inventario

    method depositar(artefactos) = inventario.addAll(artefactos)
    
    method inventarioVacío() = inventario.isEmpty()
}