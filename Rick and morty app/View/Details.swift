//
//  Details.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 29.06.2023.
//

import SwiftUI

struct Details: View {
    var charDetail : WelcomeElement?
    var episode = String()
    var body: some View {
       
        VStack{
            Text(charDetail!.name)
                .font(.largeTitle)
            AsyncImage(url: URL(string: (charDetail!.image))){ image in
                image.resizable().frame(width: 275, height: 275)
            } placeholder: {
                ProgressView()
            }
            HStack{
                Text("Status:").bold()
                Spacer(minLength: 20)
                Text(charDetail!.status)
                Spacer()
                Spacer()
            }.padding(20)
            HStack{
                Text("Specy:").bold()
                Spacer()
                Text(charDetail!.species)
                Spacer()
                Spacer()
            }.padding(20)
            HStack{
                Text("Gender:").bold()
                Spacer(minLength: 20)
                Text(charDetail!.gender.rawValue)
                Spacer()
                Spacer()
            }.padding()
            HStack{
                Text("Origin:").bold()
                Spacer(minLength: 20)
                Text(charDetail!.origin.name)
                Spacer()
                Spacer()
            }.padding()
            HStack{
                Text("Location:").bold()
                Spacer(minLength: 20)
                Text(charDetail!.location.name)
                Spacer()
                Spacer()
            }.padding()
            HStack{
                Text("Episode:").bold()
                Spacer(minLength: 20)
                Text(episode)
                Spacer()
                Spacer()
            }.padding()
            HStack{
                Text("Created at:").bold()
                Spacer(minLength: 20)
                Text(charDetail!.created)
                Spacer()
                Spacer()
            }.padding()
        }
        Spacer()
    }
}

/*struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}*/
