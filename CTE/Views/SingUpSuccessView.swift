
import SwiftUI
 struct SignUpSuccessView: View {
    @State private var showRegisterView = false
    @State private var username = ""
    @State private var password = ""
    @State private var isPasswordVisible = false // Track the state of the password visibility
     @State private var agreedToPolicy = false
     @State private var agreedToPersonal = false
     @State private var showRecoverMail = false
     var body: some View {
        VStack {
            Text("¡Bienvenido!")
                .foregroundColor(.blue)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
                .padding(.top,200)
            Text("Tu cuenta ha sido creada")
                .foregroundColor(.black)
                .font(.title)
                .padding(.bottom, 20)
            Spacer()
            Button(action: {
               // Perform sign-in action here
                showRecoverMail=true;
           }) {
               Text("Continuar")
                   .foregroundColor(.white)
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(Color.blue)
                   .cornerRadius(10)
           }
           .fullScreenCover(isPresented: $showRecoverMail) {
               NavigationView{
                   RecoverMailView()
               }
           }
           .padding(.horizontal)
           .padding(.bottom, 30)
        }
        .padding()
    }
}
 struct SignUpSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        
        SignUpSuccessView()
    }
}
