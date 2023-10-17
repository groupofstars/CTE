//
//  Configuration.swift
//  CTE
//
//  Created by Leo Taylor on 7/31/23.
//

import SwiftUI

struct Configuration: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var updatePass=false
    @State private var showAlert=false
    @State private var clearSession=false
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Text("Configuración")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                ScrollView{
                    Button(action:{
                        updatePass=true
                    })
                    {
                        HStack{
                            Text("Cambiar contraseña")
                                .padding(.horizontal)
                            Spacer()
                            Image(systemName: "chevron.forward")
                            
                        }
                        .padding()
                        .frame(width: .infinity, height: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    }
                    .fullScreenCover(isPresented: $updatePass){
                        NavigationView{
                            UpdatePass()
                        }
                    }
                    Button(action: {
                        withAnimation {
                            showAlert.toggle()
                        }
                    }) {
                        HStack{
                            Text("Cerrar sesión")
                                .padding(.horizontal)
                            Spacer()
                            Image(systemName: "chevron.forward")
                            
                        }
                        .padding()
                        .frame(width: .infinity, height: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)
            })
            .overlay(Color.black.opacity(showAlert ? 0.6:0))
            if showAlert {

                VStack {
                    Button(action: {
                        clearSession=true
                       
                    }) {
                        Text("Cerrar sesión")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    .fullScreenCover(isPresented: $clearSession){
                        ContentView()
                    }
                    Divider()
                    Button(action: {
                        withAnimation{
                            showAlert=false
                        }
                    }) {
                        Text("CANCELAR")
                            .foregroundColor(.black)
                            .font(.title)
                            .padding()
                            
                    }
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                   
                    
                    Text("Cancelar")
                            .padding()
                   
                   
                }
                .background(.white)
                .transition(.scale)
                .cornerRadius(20)
                .padding()
                .padding(.horizontal)
                
            }
        }
    }
}

struct Configuration_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Configuration()
        }
    }
}
