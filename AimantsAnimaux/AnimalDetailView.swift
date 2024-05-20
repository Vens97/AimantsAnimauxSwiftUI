import SwiftUI
import Foundation

struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        VStack {
            Image(systemName: getImageName(breed: animal.breed))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.green)
                .padding()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.green, lineWidth: 5)
                }
                .frame(width: 100, height: 100)
            GroupBox(label: Label("Description", systemImage: "list.clipboard")) {
                VStack(alignment: .leading) {
                    LineView(title: "Nom", value: animal.name)
                    LineView(title: "Race", value: animal.breed)
                    LineView(title: "Age", value: "\(animal.age) ans")
                    LineView(title: "Poids", value: "\(animal.weight) kg")
                }
                .padding()
            }
            .padding()
        }
    }
}

struct LineView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(title) : ")
            Spacer()
            Text(value)
        }
    }
}


struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleAnimal = Animal(name: "Max", breed: "Chien", age: 5, weight: 8, size: 20)
        return AnimalDetailView(animal: sampleAnimal)
    }
}
