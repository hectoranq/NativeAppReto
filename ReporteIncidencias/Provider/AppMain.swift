//
//  AppMain.swift
//  ReporteIncidencias
//
//  Created by ivan aquino on 9/3/23.
//

import Foundation

class  AppMain: NSObject {
    ///Preguntas seleccionadas
    func GuardarIncidencias(solicitud: [Incidencias]) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try! encoder.encode(solicitud)
        defaults.set(data, forKey: Application.APPINCIDENCIA)
    }
    
    func ObtenerIncidencias()->[Incidencias] {
        var loadedsolicitud = [Incidencias]()
        let solicitud = UserDefaults.standard.object(forKey: Application.APPINCIDENCIA) as? Data
        if solicitud != nil {
            let decoder = JSONDecoder()
            loadedsolicitud = try! decoder.decode([Incidencias].self, from: solicitud!)
            return loadedsolicitud
        }else{
            return [Incidencias]()
        }
        
       
    }
}
