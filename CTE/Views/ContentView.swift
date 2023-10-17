
import SwiftUI
 struct ContentView: View {
    @State private var showRegisterView = false
     @State private var showMainView = false
     @State private var forgotPa = false
    @State private var username = ""
    @State private var password = ""
    @State private var isPasswordVisible = false // Track the state of the password visibility
     
     @StateObject private var loginViewModel = LoginViewModel()
     
     @EnvironmentObject var sessionManager: SessionManager
     
     var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
             TextField("Usuario", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 10)
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
            .padding(.bottom, 10)
             Button(action: {
                // Perform sign-in action here
//                 sessionManager.login()
                loginViewModel.login(username: username, password: password)
//                     showMainView = true
            }) {
                Text("Ingresar")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showMainView) {
               NavigationView{
                   MainPage()
//                       .navigationBarHidden(false)
               }
           }
            .padding(.horizontal)
            .padding(.bottom, 10)
             HStack {
                 Button{
                     showRegisterView = true
                     
                 } label:{
                    Text("Hazte miembro")
                    .foregroundColor(.blue)
                }
                 .fullScreenCover(isPresented: $showRegisterView) {
                    NavigationView{
                        RegisterView()
//                            .navigationBarHidden(false)
                    }
                }
                 Spacer()
                 Button(action: {
                     forgotPa=true;
                }) {
                    Text("Olvidé mi contraseña")
                        .foregroundColor(.blue)
                }
                .fullScreenCover(isPresented: $forgotPa) {
                    NavigationView{
                        forgotPass()
                    }
                }
                 
            }
            .padding(.horizontal)
        }
        .padding()
        .alert(isPresented: $loginViewModel.isLoggedIn) {
            Alert(title: Text("Login Successful"), message: nil, dismissButton: .default(Text("OK")))
            
        }
         
    }
}
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
            ContentView()
    }
}
