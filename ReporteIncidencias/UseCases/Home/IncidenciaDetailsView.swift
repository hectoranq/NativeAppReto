//
//  IncidenciaDetailsView.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import SwiftUI

struct IncidenciaDetailsView: View {
    var incidencia: Incidencias
    var body: some View {
        VStack{
            CircleImageView(image: incidencia.imageString)
                .offset(y: -130)
                .padding(.bottom, -130)
               
            VStack(alignment: .leading) {
                Text(incidencia.imageName)
                    .font(.title)

                Divider()

              
                Text(incidencia.description)
            }
            .padding()
        }.navigationTitle(incidencia.imageName)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

