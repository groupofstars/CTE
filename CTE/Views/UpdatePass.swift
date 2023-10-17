//
//  UpdatePass.swift
//  CTE
//
//  Created by Leo Taylor on 7/31/23.
//

import SwiftUI

struct UpdatePass: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPasswordVisible=false
    
    @StateObject private var passwordChangeViewModel = PasswordChangeViewModel()
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    @State private var confirm=false
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Crea una nueva contraseña")
                .font(.title)
                .padding(.horizontal)
                .foregroundColor(.blue)
            ScrollView{
                VStack(alignment:.leading){
                    Text("Contraseña actual")
                        .padding(.horizontal)
                    
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Contraseña actual", text: $currentPassword)
                        } else {
                            SecureField("Contraseña actual", text: $currentPassword)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                
                VStack(alignment:.leading){
                    Text("Nueva Contraseña")
                        .padding(.horizontal)
                    
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Nueva Contraseña", text: $newPassword)
                        } else {
                            SecureField("Nueva Contraseña", text: $newPassword)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                VStack(alignment:.leading){
                    Text("Confirmar Contraseña")
                        .padding(.horizontal)
                    
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Confirmar Contraseña", text: $confirmPassword)
                        } else {
                            SecureField("Confirmar Contraseña", text: $confirmPassword)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                Text("La contraseña debe contener mínimo 6 dígitos, al menos una mayúscula, una minúscula y un carácter especial")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal	)
                Button(action: {
                    passwordChangeViewModel.changePassword(currentPassword: currentPassword, newPassword: newPassword, confirmPassword: confirmPassword)
                        
                   }) {
                       Text("Confirmar")
                           .foregroundColor(.white)
                           .padding()
                           .frame(maxWidth: .infinity)
                           .background(Color.blue)
                           .cornerRadius(10)
                   }
                   .fullScreenCover(isPresented: $confirm) {
                      NavigationView{
                          SuccessPan(passedString: "Tu contraseña ha sido cambiada con éxito")
                      }
                  }
                   .padding(.horizontal)
                   .padding(.bottom, 10)
            }
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
        .alert(isPresented: $passwordChangeViewModel.isChanged) {
            Alert(
                title: Text("Password Changed"),
                message: nil,
                dismissButton: .default(Text("OK"),action: {
                    confirm = true
                })
            )
        }
    }
}

struct UpdatePass_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UpdatePass()
        }
    }
}
