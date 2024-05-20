//
//  ContentView.swift
//  AimantsAnimaux
//
//  Created by Altieri on 23/04/2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
 
        let sampleAnimals = [
            Animal(name: "Max", breed: "Chien", age: 5, weight: 8, size: 20),
            Animal(name: "Nuage", breed: "Lapin", age: 2, weight: 1.5, size: 10),
            Animal(name: "Blanche", breed: "Oiseau", age: 1, weight: 0.2, size: 10),
            Animal(name: "Francis", breed: "Poisson", age: 0.3, weight: 0.2, size: 2.1)
        ]
        
        AnimalsListView(animals: sampleAnimals)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

