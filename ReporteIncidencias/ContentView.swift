//
//  ContentView.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appRouter: AppRouter
    var data = [Incidencias(id: 1, description: "Creacion de planta baja", imageName: "chilkoottrail",imageString : ""), Incidencias(id: 2, description: "Creacion de planta alta", imageName: "umbagog",imageString : "")];
    
    init(){
        data = AppMain().ObtenerIncidencias()
    }
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
           
               /*GeometryReader{ _ in
                    NavBarView( appstate: .home, tituloCabecera: "Listado de Incidencias")
                }.frame(height: NavBarView.navbarBackgroundHeight)*/
                
                NavigationView{
                    List(data) { datincidencia in
                        NavigationLink{
                            IncidenciaDetailsView(incidencia: datincidencia)
                        } label: {
                            IncidenciaRowView(incidencia: datincidencia)
                        }
                    }
                    .navigationTitle("Listado de incidencias")
                    
                   
                }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        appRouter.state = .register
                    }, label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
