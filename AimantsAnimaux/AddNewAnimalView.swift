import SwiftUI
import Foundation



// La vue qui permet d'ajouter un nouvel animal à la liste existante
struct AddNewAnimalView: View {
    // Déclaration des états pour les champs de saisie
    @State private var name: String = ""
    @State private var breed: Breed = .dog
    @State private var age: String = ""
    @State private var weight: String = ""
    @State private var size: String = ""
    
    var body: some View {
        VStack {
            // Titre de la vue
            Text("Ajouter un nouvel animal")
                .font(.largeTitle)
            // Formulaire pour saisir les informations sur le nouvel animal
            Form {
                TextField("Nom", text: $name)
                Picker("Espèce", selection: $breed) {
                    ForEach(Breed.allCases, id: \.self) { b in
                        Text(b.rawValue)
                    }
                }
                TextField("Age (en années)", text: $age)
                    .keyboardType(.decimalPad)
                TextField("Poids (en kg)", text: $weight)
                    .keyboardType(.decimalPad)
                TextField("Taille (en cm)", text: $size)
                    .keyboardType(.decimalPad)
            }
            // Bouton pour ajouter le nouvel animal
            Button(action: {
                if formIsValid {
                    if let ageValue = Float(age), let weightValue = Float(weight), let sizeValue = Float(size) {
                        // Affiche les informations de l'animal dans la console
                        print("Ajout de \(name) à la liste avec Age: \(ageValue), Poids: \(weightValue), Taille: \(sizeValue)")
                    } else {
                        // Affiche un message si les valeurs numériques ne sont pas valides
                        print("Les valeurs numériques ne sont pas valides")
                    }
                }
            }) {
                Spacer()
                Text("Ajouter")
                    .font(.title)
                Spacer()
            }
            // Désactive le bouton s'il y a des champs vides ou des valeurs non numériques
            .disabled(!formIsValid)
            .padding(.top, 22)
            .background(buttonColor)
            .foregroundColor(.white)
        }
    }
    
    // Vérifie si le formulaire est valide
    var formIsValid: Bool {
        return !name.isEmpty && !age.isEmpty && !weight.isEmpty && !size.isEmpty && Float(age) != nil && Float(weight) != nil && Float(size) != nil
    }
    
    // Détermine la couleur du bouton en fonction de la validité du formulaire
    var buttonColor: Color {
        return formIsValid ? .green : .gray
    }
}

// Aperçu de la vue AddNewAnimalView
struct AddNewAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAnimalView()
    }
}
