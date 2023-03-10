//
//  AppRouter.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {
    @Published var state: AppState = .home
}

enum AppState {
    case home
    case register
   
}
