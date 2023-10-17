import SwiftUI
 struct forgotPass: View {
     @State private var mail = ""
     
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     @State private var showMainPage = false
     
     
     @StateObject private var passwordResetViewModel = PasswordResetViewModel()
     @State private var email: String = ""
     @State private var additionalProp2 = ""
     @State private var additionalProp3 = ""
     
     @State private var isSecureTextEntry: Bool = true
     
     @State private var isEmailValid: Bool = true
     
     private let emailRegex = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

     @State private var showNext = false
     var body: some View {
        VStack {
            Text("Recupera tu contraseña")
                .font(.title)
                .padding()
                .foregroundColor(.blue)
            
            Text("Ingresa el email asociado con tu cuenta y te enviaremos un correo con las instrucciones para restablecer tu contraseña")
                .font(.body)
                .padding(40)
                .multilineTextAlignment(    .center)
            
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                if isSecureTextEntry {
                    TextField("Correo electrónico", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: email) { newValue in
                            isEmailValid = validateEmail(email: newValue)
                        }
                }
                else{
                    SecureField("Correo electrónico",text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: email) { newValue in
                            isEmailValid = validateEmail(email: newValue)
                        }
                }
                Button(action: {
                    self.isSecureTextEntry.toggle()
                }) {
                    Image(systemName: self.isSecureTextEntry ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal,40)
            if !isEmailValid {
                Text("Por favor introduzca una dirección de correo electrónico válida")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.horizontal)
            }
            // Add more views or actions as needed
            Spacer()
            Button(action: {
                // Perform registration action here
                if isEmailValid {
                    passwordResetViewModel.resetPassword(additionalProp1: email, additionalProp2: additionalProp2, additionalProp3: additionalProp3)
                }
                
            }) {
                Text("Enviar")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .opacity(isEmailValid && email != "" ? 1: 0.5)
            .fullScreenCover(isPresented: $showNext) {
                NavigationView{
                    RecoverMailView()
                }
            }
            .padding(.horizontal,40)
            .padding(.vertical,60)
            
            
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
        .alert(isPresented: $passwordResetViewModel.isReset) {
            Alert(
                title: Text("Password Reset Successful"),
                message: nil,
                dismissButton: .default(Text("OK"),action: {
                    showNext = true
                })
            )
        }
       
    }
     private func validateEmail(email: String) -> Bool {
         let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
         return emailPredicate.evaluate(with: email)
     }
     
}

struct forgotPass_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            forgotPass()
        }
    }
}
