class Empleado {
    var nombre
    var direccion
    var estadoCivil
    var fechaNac
    var sueldoBasico

    method calcularNeto() {
        return self.calcularBruto() - self.calcularRetenciones()
    }

    method calcEdad()

    method calcularBruto()

    method calcularRetenciones()
}

class Permanente inherits Empleado {
    var cantHijos
    var antiguedad

    method calcularBruto() {
        return sueldoBasico +
               (150 * cantHijos) +
               estadoCivil.bono() +
               (50 * antiguedad)
    }

    method calcularRetenciones() {
        return (self.calcularBruto() * 0.10) + (20 * cantHijos) + (self.calcularBruto() * 0.15)
    }
}

class Temporal inherits Empleado {
    var fechaFin
    var horasExtra


    method calcularBruto() {
        return sueldoBasico + (40 * horasExtra)
    }

    method calcularRetenciones() {
        var obraSocialExtra = 0
        if (self.calcEdad() > 50) obraSocialExtra = 25
        return (self.calcularBruto() * 0.10) + obraSocialExtra +
               (self.calcularBruto() * 0.10) + (5 * horasExtra)
    }
}

class EstadoCivil {
    method bono()
}

class Casado inherits EstadoCivil {
    method bono() { return 100 }
}

class Soltero inherits EstadoCivil {
    method bono() { return 0 }
}

class ReciboDeHaberes {
    var nombreEmpleado
    var direccion
    var fechaEmision
    var sueldoBruto
    var sueldoNeto
    var conceptos


}

class Empresa {
    var property nombre
    var  property cuit
    var listaEmpleados = []


    method agregarEmpleado(empleado) {
        listaEmpleados.add(empleado)
    }

    method totalSueldosNetos() {
        return listaEmpleados.sum({ e => e.calcularNeto() })
    }

    method totalSueldosBrutos() {
        return listaEmpleados.sum({ e => e.calcularBruto() })
    }

    method totalRetenciones() {
        return listaEmpleados.sum({ e => e.calcularRetenciones() })
    }

    
}