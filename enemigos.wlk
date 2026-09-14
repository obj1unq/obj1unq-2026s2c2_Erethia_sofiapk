import artefactosMagicos.*
import rolando.*

object erethia {
    const enemigos = [caterina, archibaldo, astra]

    method enemigos() = enemigos 

    method enemigosVenciblesPor(personaje) {
        return enemigos.filter( {enemigo => enemigo.poderDePelea() < personaje.poderDePelea()} )
    }

    method casaDeEnemigosConquistablesPor(personaje) {
        return self.enemigosVenciblesPor(personaje).map( {enemigo => enemigo.casa()} )
    }

    method esElMásPoderoso(personaje) {
        return enemigos.all( { enemigo => enemigo.poderDePelea() < personaje.poderDePelea()} )
    }
}

object caterina {
    const casa = fortalezaDeAcero

    method casa() = casa

    method poderDePelea() = 28
}

object archibaldo {
    const casa = palacioDeMármol

    method casa() = casa

    method poderDePelea() = 16
}

object astra {
    const casa = torreDeMarfil

    method casa() = casa

    method poderDePelea() = 14
}

// MORADAS
object fortalezaDeAcero {
  
}

object palacioDeMármol {
  
}

object torreDeMarfil {
  
}