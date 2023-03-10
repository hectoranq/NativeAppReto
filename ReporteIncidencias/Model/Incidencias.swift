//
//  Incidencias.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import Foundation
import SwiftUI


struct Incidencias: Identifiable, Codable {
    var id: Int
    var description: String
    var imageName: String
    var imageString: String
    var image: Image {
        Image(imageName)
    }
}
