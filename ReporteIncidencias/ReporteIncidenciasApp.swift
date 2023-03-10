//
//  ReporteIncidenciasApp.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import SwiftUI

@main
struct ReporteIncidenciasApp: App {
    
    @StateObject var appRouter = AppRouter()
    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .home:
            ContentView()
        case .register:
            RegisterView()
        
        }
    }
    
    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
        }
    }
}
