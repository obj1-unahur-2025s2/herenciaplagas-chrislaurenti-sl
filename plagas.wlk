import elementos.*

class Plaga {
    var property poblacion

    method transmiteEnfermedades() = poblacion >= 10

    method ataca(unElemento){ unElemento.efectoAtaque(self) 
    self.consecuencia()}

    method consecuencia() {poblacion += poblacion * 0.1}
}

class Cucaracha inherits Plaga {
    var property pesoPromedio

    method danio() = poblacion / 2
    override method transmiteEnfermedades() = pesoPromedio >= 10 && super()

    override method consecuencia() {pesoPromedio += 2
     super()}
}

class Pulga inherits Plaga {
    method danio() = poblacion * 2


}
/*
"GARRAPATA" puede ser SUBCLASE de "Pulga" ya que comparten el metodo,
esto es lo mas conveniente por mas que conceptualmente la garrapata no sea una pulga
*/

class Garrapata inherits Plaga {
    method danio() = poblacion * 2

    override method consecuencia() {poblacion *= 1.2}
}

class Mosquito inherits Plaga {
    method danio() = poblacion
    override method transmiteEnfermedades() = poblacion % 3 == 0 && super()


}