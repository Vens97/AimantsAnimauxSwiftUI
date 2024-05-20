


import Foundation


// Déclaration de la structure Animal pour représenter un animal
struct Animal {
    let name: String
    let breed: String
    let age: Float
    let weight: Float
    let size: Float
}

// Enum pour représenter les races d'animaux
enum Breed: String, CaseIterable {
    case dog = "Chien"
    case cat = "Chat"
    // Ajoutez d'autres races au besoin
}

// Fonction pour obtenir le nom de l'icône correspondant à la race de l'animal
func getImageName(breed: String) -> String {
    switch breed {
    case "Chien":
        return "dog"
    case "Chat":
        return "cat"
    case "Poisson":
        return "fish"
    case "Oiseau":
        return "bird"
    case "Lapin":
        return "rabbit"
    default:
        return "pawprint"
    }
}

// Liste d'animaux d'exemple
let animalList = [
    Animal(name: "Max", breed: "Chien", age: 5, weight: 8, size: 20),
    Animal(name: "Nuage", breed: "Lapin", age: 2, weight: 1.5, size: 10),
    Animal(name: "Blanche", breed: "Oiseau", age: 1, weight: 0.2, size: 10),
    Animal(name: "Francis", breed: "Poisson", age: 0.3, weight: 0.2, size: 2.1)
]

