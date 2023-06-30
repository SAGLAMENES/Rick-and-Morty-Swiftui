//
//  FilterButtons.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 24.06.2023.
//

import SwiftUI
struct HorizantalFilter: View{
    @State var buttonTouched = false
    var locations : Locations
    var body: some View{
    
        
            VStack{
                Text("")
            }.frame(width: 160,height: 75).background(
                RoundedRectangle(cornerRadius: 10).stroke(Color.black,lineWidth: 2)).background(buttonTouched ? .gray : .white).cornerRadius(10).onTapGesture {
                    buttonTouched.toggle()
                }
    }
    }

/*struct FilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtons()
    }
}*/
