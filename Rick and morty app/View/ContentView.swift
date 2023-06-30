//
//  ContentView.swift
//  Rick and Morty app
//
//  Created by Enes Saglam on 24.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State var locationsNames = [Locations]()
    @ObservedObject var viewModel = MainPageViewModel()
    @State var allTapped = true
    @State var filterButtonTapped = false
    @State var charactersInLocation = [String]()
    @State var filtersTapped = false
    @State var selectedLocation : Locations?
    @State var characterInLocation = String()
    var body: some View {
        GeometryReader { geometry in
            NavigationStack() {

                    List {
                        Image("Rick-and-Morty")
                            .resizable()
                            .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.2).listRowSeparator(.hidden)
                        
                        ScrollView(.horizontal){
                            
                            LazyHStack{
                                Text("All Characters")
                                
                            .frame(width: 160,height: 75).background(
                                RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 2)).background(allTapped ? .gray : .white).onTapGesture {
                                    allTapped = true
                                    filtersTapped = false
                                }

                                ForEach(viewModel.locationList) { locate in
                                    Text(locate.name)
                                    
                                .frame(width: 160,height: 75).background(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 2).background(selectedLocation == locate && allTapped == false ? Color.gray : Color.white)).onTapGesture {
                                        selectedLocation = locate
                                        characterInLocation = ""
                                        for i in selectedLocation!.residents{
                                            characterInLocation += String(i.dropFirst(42)) + ","
                                            print(characterInLocation)
                                        }
                                        characterInLocation = String(characterInLocation.dropLast())
                                        print(characterInLocation)
                                        
                                        viewModel.downloadLocationCharacters(locationId: characterInLocation)
                                       filtersTapped = true
                                        allTapped = false
                                        
                                    }
                                }
                            }
                        }
                        if filtersTapped && characterInLocation.count != 1{
                            ForEach(viewModel.ricksLists!) { name in
                                let episodes = name.episode.map { String($0.dropFirst(40))}.joined(separator: ", ")
                                NavigationLink(destination: Details(charDetail: name, episode: episodes)){
                                    RAMList(ramCharacters: name)
                                        .padding(.horizontal, geometry.size.width * 0.05)
                                        .listRowSeparator(.hidden)
                                }
                            }
                            
                        }else{
                            
                        }
                        if allTapped {
                            
                            ForEach(viewModel.ricksList) { ricks in
                                let episodes = ricks.episode.map {
                                    String($0.dropFirst(40))}.joined(separator: ", ")
                                NavigationLink(destination: Details2(charDetail: ricks, episode: episodes)){
                                    RAMPage(ramCharacters: ricks)
                                        .padding(.horizontal, geometry.size.width * 0.05)
                                        .listRowSeparator(.hidden)
                                }
                            }
                        }
                    }
                    .listStyle(.grouped)
                    .onAppear {
                        viewModel.downloadCharacters()
                        viewModel.downloadLocations()
                        viewModel.downloadLocationCharacters()
                        print(characterInLocation)

                        //print(viewModel.locationList[1].name)
                    }
                }
            .edgesIgnoringSafeArea(.all)
        }.edgesIgnoringSafeArea(.all)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
