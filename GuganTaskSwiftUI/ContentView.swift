//
//  ContentView.swift
//  GuganTaskSwiftUI
//
//  Created by Gugan on 03/09/24.
//

import SwiftUI

import SwiftUI

var currentBankingIndex: Int = 0

struct ContentView: View {
    @State private var currentIndex = 0
    init(){
        SharedInstance.shared.bankingData = SharedInstance.shared.getmodelData()
    }
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    // Top Carousel
                    TabView {
                        ForEach(0..<SharedInstance.shared.bankingData.data.count ) { index in
                            Image("\(SharedInstance.shared.bankingData.data[index].image)") // Replace with your actual image name
                                .resizable().aspectRatio(contentMode: .fill)
                                .cornerRadius(20.0)
                                .padding(.all, 20)
                                .tag(SharedInstance.shared.bankingData.data[index].id)
                                .frame(width: geometry.size.width, height: 200)
                                .clipped()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 200)
                    .onChange(of: currentBankingIndex) { newValue in
                                    debugPrint("[a]: new value \(newValue)")
                    }
                    // Search Bar
                    TextField("Search", text: .constant(""))
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    // List Items
                    List(0..<SharedInstance.shared.bankingData.data[currentBankingIndex].subtitle.count, id: \.self) { index in
                        HStack {
                            Image("\(SharedInstance.shared.bankingData.data[currentBankingIndex].image)") // Replace with your actual image name
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(SharedInstance.shared.bankingData.data[currentBankingIndex].title)
                                    .font(.headline).frame(width: geometry.size.width - 120,alignment: .leading)
                                Text(SharedInstance.shared.bankingData.data[currentBankingIndex].subtitle[index])
                                    .font(.subheadline).frame(width: geometry.size.width - 120,alignment: .leading)
                                    .foregroundColor(.secondary).multilineTextAlignment(.leading)
                            }
                            .padding(.leading)
                        }
                        .padding(8)
                        .background(Color(.systemMint).opacity(0.2))
                        .cornerRadius(10)
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: geometry.size.height / 1.75)

                    // Spacer()
                    // Floating Action Button
                    FloatingActionButton()
                    .navigationBarHidden(true)
                }
            }
            
            
        }
    }
}

struct FloatingActionButton: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button(action: {
                    // Your action here
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.blue)
                        .cornerRadius(28)
                        .shadow(radius: 10)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



#Preview {
    ContentView()
}
