//
//  MainPageViewModel.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 24.06.2023.
//

import Foundation
import Alamofire

class MainPageViewModel : ObservableObject{
    @Published var ricksList = [Result]()
    @Published var locationList = [Locations]()
    @Published var ricksLists : [WelcomeElement]?
    @Published var oneRicks : Result?
    func downloadCharacters(){
        
        for page in 1...41{
            
            let url = "https://rickandmortyapi.com/api/character/?page=\(page)"
            AF.request(url, method: .get).response { response in
                if let data = response.data {
                    do{
                        let veri = try JSONDecoder().decode(Welcome.self, from: data)
                        if let liste = veri.results{
                            DispatchQueue.main.async {
                                self.ricksList += liste
                                // print(liste.count)
                            }
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }
                // page+=1
            }
        }
    }
    func downloadLocations( locationId : String = "1,2"  ){
        // while page<=42{
        
        let url = "https://rickandmortyapi.com/api/location?page=\(locationId)"
        AF.request(url, method: .get).response { response in
            if let data = response.data {
                do{
                    let veri = try JSONDecoder().decode(LocationData.self, from: data)
                    if let liste = veri.results{
                        DispatchQueue.main.async {
                            self.locationList = liste
                            
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                
            }
        }
    }
    func downloadLocationCharacters( locationId : String = "1,2,3"  ){
        // while page<=42{
        if locationId.count == 1 {
            let url = "https://rickandmortyapi.com/api/character/\(locationId)"
            AF.request(url, method: .get).response { response in
                if let data = response.data {
                    do{
                        
                        let veri = try JSONDecoder().decode(Result?.self, from: data)
                        if let liste = veri{
                            DispatchQueue.main.async {
                                self.oneRicks = liste
                                //   print(liste)
                            }
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }else{
            let url = "https://rickandmortyapi.com/api/character/\(locationId)"
            AF.request(url, method: .get).response { response in
                if let data = response.data {
                    do{
                        
                        let veri = try JSONDecoder().decode([WelcomeElement]?.self, from: data)
                        if let liste = veri{
                            DispatchQueue.main.async {
                                self.ricksLists = liste
                                //   print(liste)
                            }
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }
        
    }
}
