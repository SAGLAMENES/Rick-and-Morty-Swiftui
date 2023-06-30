//
//  RAMPage.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 24.06.2023.
//

import SwiftUI

struct RAMPage: View {
    var ramCharacters : Result
    var body: some View {
        
        
        
        if ramCharacters.gender == Gender.female {
            HStack(){
                
                AsyncImage(url: URL(string: (ramCharacters.image!))){ image in
                    image.resizable().frame(width: 140, height: 200)
                } placeholder: {
                    ProgressView()
                }.frame(width: 100,height: 200)
                    .clipped()
                Image("female").resizable().frame(width: 100,height: 100).opacity(90.0)
                
                Text(ramCharacters.name!).font(.avenirFont(style: "Bold", size: 20))
            }.frame(width: 380,height: 200, alignment: .topLeading).border(Color.gray).buttonBorderShape(.capsule).padding(.leading)
        }
                        
            else {
                HStack(){
                    Text(ramCharacters.name!).font(.avenirFont(style: "Bold", size: 20))
                    
                    if ramCharacters.gender == Gender.male{
                            Image("male").resizable().frame(width: 100,height: 100)
                        }else{
                            Image("unknown").resizable().frame(width: 100,height: 100)
                        }
                    AsyncImage(url: URL(string: (ramCharacters.image!))){ image in
                        image.resizable().frame(width: 140, height: 200)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 100,height: 200)
                        .clipped()
                }.frame(width: 380,height: 200, alignment: .topTrailing).border(Color.gray).buttonBorderShape(.capsule).padding(.leading)
                    
                    
                }
                
            }
        
    
        
}
extension Font {
    static func avenirFont(style: String, size: CGFloat) -> Font {
        return Font.custom("Avenir-\(style)", size: size)
    }
}

/*struct RAMPage_Previews: PreviewProvider {
    static var previews: some View {
        RAMPage()
    }
}
*/
