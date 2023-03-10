//
//  IncidenciaRowView.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import SwiftUI

struct IncidenciaRowView: View {
    var incidencia: Incidencias
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: Data(base64Encoded: incidencia.imageString) ?? Data()) ?? UIImage())
                .resizable()
                .frame(width: 50, height: 50)
            Text(incidencia.description)

            Spacer()
        }
    }
}

