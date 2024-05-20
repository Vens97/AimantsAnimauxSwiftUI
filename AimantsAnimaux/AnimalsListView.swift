import SwiftUI
import Foundation



// Vue pour afficher la liste des animaux
struct AnimalsListView: View {
    // Liste des animaux à afficher
    let animals: [Animal]
    
    var body: some View {
        // Utilisation de NavigationView pour la navigation entre les vues
        NavigationView {
            VStack {
            
                Image("aimantsDanimauxBan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 210)
                
                // Utilisation de List pour afficher la liste des animaux
                List(animals, id: \.name) { animal in
                    // Utilisation de NavigationLink pour naviguer vers la vue AnimalDetailView lorsqu'un animal est sélectionné
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        // Affichage de chaque ligne d'animal à l'aide de la vue AnimalRow
                        AnimalRow(animal: animal)
                    }
                }
               
                .navigationTitle("Liste des Animaux")
                // Ajout d'un bouton "Ajouter" à la barre de navigation
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddNewAnimalView()) {
                            Text("Ajouter")
                                .font(.headline)
                                .padding(8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

// Vue pour afficher une ligne d'animal dans la liste
struct AnimalRow: View {
    let animal: Animal
    
    var body: some View {
        HStack {
            
            Image(systemName: getImageName(breed: animal.breed))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.green)
                .frame(width: 40, height: 40)
                .padding(8)
        
            Text(animal.name)
                .bold()
            Spacer()
        }
    }
}



// Aperçu de la vue AnimalsListView
struct AnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        // Création d'une liste d'animaux d'exemple pour l'aperçu
        let sampleAnimals = [
            Animal(name: "Max", breed: "Chien", age: 5, weight: 8, size: 20),
            Animal(name: "Nuage", breed: "Lapin", age: 2, weight: 1.5, size: 10),
            Animal(name: "Blanche", breed: "Oiseau", age: 1, weight: 0.2, size: 10),
            Animal(name: "Francis", breed: "Poisson", age: 0.3, weight: 0.2, size: 2.1)
        ]
        // Retourne la vue AnimalsListView avec la liste d'animaux d'exemple pour l'aperçu
        return AnimalsListView(animals: sampleAnimals)
    }
}
