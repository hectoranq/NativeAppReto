//
//  RegisterView.swift
//  ReporteIncidencias
//
//  Created by Ecofuturo MacOS on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    @State var descripcion: String = ""
    
    @State private var sourceType: UIImagePickerController.SourceType = .camera
       @State private var selectedImage: UIImage?
       @State private var isImagePickerDisplay = false
    @State private var showingAlert = false
    @EnvironmentObject var appRouter: AppRouter
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Descripción")) {
                    
                    TextField("", text: $descripcion)
                }
                
                Section(header: Text("Seleccione Foto")) {
                    
                    Button("Camera") {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }.padding()
                }
                
                
                HStack(alignment: .center){
                    Spacer()
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                            .frame(width: 200, height: 200)
                    } else {
                        Image( "umbagog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    Spacer()
                }
                
                Section {
                    // Toggle
                    
                    
                    // Button
                    Button(action: {
                        showingAlert = self.GuardarIncidencia()
                    }) {
                        HStack {
                            Spacer()
                            Text("Guardar")
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .alert("Se guardo correctamente", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) {
                                    showingAlert = false
                                    appRouter.state = .home
                                }
                            }
                    
                }
                
            }
            .navigationBarTitle("Registro Incidencia")
            .sheet(isPresented: self.$isImagePickerDisplay) {
                            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                        }

        }
    }
    
    
    func GuardarIncidencia() -> Bool {
        
        if  self.descripcion == "" {
            return false
        }
        
        if selectedImage == nil {
            return false
        }
        
        var strImage = self.selectedImage?.base64
        var listIncidencias = AppMain().ObtenerIncidencias()
        var id = listIncidencias.count + 1
        var incidencias = Incidencias(id: id, description: self.descripcion, imageName: "", imageString: strImage ?? "")
       
        listIncidencias.append(incidencias)
        
        AppMain().GuardarIncidencias(solicitud: listIncidencias)
        return  true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}
