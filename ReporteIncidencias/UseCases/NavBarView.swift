//
//  NavBarView.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import SwiftUI

struct NavBarView: View {
    @EnvironmentObject var appRouter: AppRouter
    var appstate : AppState
    @State var tituloCabecera : String
    static let navbarBackgroundHeight: CGFloat = 50
    var body: some View {
        ZStack{
            HStack{
                Button(action: {
                    appRouter.state = appstate
                }, label: {
                    if appstate != .home {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 10, height: 20)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                })
                Spacer()
                Text(tituloCabecera)
                    .foregroundColor(Color.white)
                    .font(.custom("Arial", size: 18))
                    .frame(alignment: .center)
                Spacer()
                Button(action: {
                    appRouter.state = .home
                }, label: {
                   
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding()
                    
                })
            }.background(Color.blue)
                
        }
    }
}


