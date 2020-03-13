import UIKit

let base = 4
let altura = 6

var area = (base * altura) / 2
print(area)


let personas = ["Daniel", "Daniela", "Diego", "Linda", "Noel"]
print(personas.count)
for persona in personas{
    print(persona)
}

func calcularMasaCorporal(peso:Double, altura:Double) -> String {
    var estatusDelPaciente:String;
    let imc = peso / (altura * altura)
    if(imc >= 19 && imc <= 24.9){
        estatusDelPaciente = "El paciente se encuentra en el peso adecuado"
    } else {
        estatusDelPaciente = "El paciente NO se encuentra en el peso adecuado"
    }
    return estatusDelPaciente
}

print(calcularMasaCorporal(peso: 70, altura: 1.77))
