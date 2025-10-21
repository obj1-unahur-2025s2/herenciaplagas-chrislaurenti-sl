import plagas.*

class Hogar  {
    var property mugre
    var property confort

    method esBueno() = mugre <= confort / 2

    method efectoAtaque(unaPlaga){ mugre += unaPlaga.danio() }

}

class Huerta {
    var property capProduccion

    method esBueno() =  capProduccion > nivelFijo.nivelMinimo()

    method efectoAtaque(unaPlaga){ capProduccion -= (unaPlaga.danio() * 0.1 + self.adicional(unaPlaga))}

    method adicional(unaPlaga) = if(unaPlaga.transmiteEnfermedades()) 10 else 0
}

object nivelFijo {
    var property nivelMinimo = 0
}

class Mascota {
    var property salud

    method esBueno() = salud > 250

    method efectoAtaque(unaPlaga){ if(unaPlaga.transmiteEnfermedades()) salud -= unaPlaga.danio() }
}

class Barrio {
    const property elementos = #{}

    method agregarElemento(unElemento) {elementos.add(unElemento)}
    method quitarElemento(unElemento) {elementos.remove(unElemento)}

    method esCopado() = elementos.count({e => e.esBueno()}) > elementos.count({e => !e.esBueno()}) //Tambien puedo comparar con la mitad del size: elementos.size() / 2
}
