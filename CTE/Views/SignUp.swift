
import SwiftUI
 struct SignUp: View {
    
     @StateObject private var signupConfirmViewModel = SignupConfirmViewModel()
     
     @State private var userId = ""
     @State private var username = ""
     @State private var password = ""
     @State private var privacyPolicyAgreed = false
     @State private var dataProcessAgreed = false
     
    @State private var isPasswordVisible = false // Track the state of the password visibility
     
     @State private var showInterestView = false
     var body: some View {
        VStack {
            Text("Crea tu usuario")
                .foregroundColor(.blue)
                .frame(width: 300, height: 100)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
             TextField("Usuario", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 20)
             ZStack(alignment: .trailing) {
                if isPasswordVisible {
                    TextField("Contraseña", text: $password)
                } else {
                    SecureField("Contraseña", text: $password)
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
            .padding(.bottom, 40)
            
            Text("La contraseña debe contener un mínimo de 6 dígitos, al menos una letra mayúscula, una letra minúscula y un carácter especial")
                .padding(.horizontal,20)
            .padding(.bottom, 40)
            .multilineTextAlignment(.center)
            .foregroundColor(.green)
            
            HStack {
                Spacer()
                Toggle("He leido y acepto las Pliticas de Privacidad y ademas los Terminos y Condiciones", isOn: $privacyPolicyAgreed)
                    .padding(.trailing)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            .font(.system(size:15))
            HStack {
                Spacer()
                Toggle("He leido y otorgo Consentimiento para el Tratamiento de datos personales", isOn: $dataProcessAgreed)
                    .padding(.trailing)
            }
            .padding(.horizontal)
            .padding(.bottom, 60)
            .font(.system(size:15))
            Button(action: {
               // Perform sign-in action here
                signupConfirmViewModel.signupConfirm(
                    userId: userId,
                    username: username,
                    password: password,
                    privacyPolicyAgreed: privacyPolicyAgreed,
                    dataProcessAgreed: dataProcessAgreed
                )
                
           }) {
               Text("Continuar"	)
                   .foregroundColor(.white)
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(Color.blue)
                   .cornerRadius(10)
           }
           .fullScreenCover(isPresented: $showInterestView) {
               NavigationView{
                   InterestView()
               }
           }
           .padding(.horizontal)
           .padding(.bottom, 10)
        }
        .padding()
        .alert(isPresented: $signupConfirmViewModel.isSignupConfirmed) {
            Alert(
                title: Text("Signup Confirmation Successful"),
                message: nil,
                dismissButton: .default(Text("OK"),action:{
                    
                    
                    showInterestView=true
                })
            )
        }
        
    }
    
}
 struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        
        SignUp()
    }
}
