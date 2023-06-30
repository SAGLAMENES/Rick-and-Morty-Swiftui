//
//  SplashScreen.swift
//  Rick and morty app
//
//  Created by Enes Saglam on 30.06.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isOppened = false
    @State private var size = 1.1
    @State private var opacity = 0.7
    var body: some View {
        if isOppened{
            ContentView()
        } else{
            VStack {
                VStack(){
                    Image("Splash").resizable().frame(width: 400,height: 400)
                    Text("WELCOME!").font(Font.custom("Baskerville-Bold", size: 50))
                }.scaleEffect(size)
                    .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.5)){
                        self.size = 5
                        self.opacity = 1
                    }
            }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
                    withAnimation{
                        self.isOppened = true
                    }

                }
            }
        }
       
    }
        
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
