import SwiftUI
 struct RecoverMailView: View {
     @State private var mail = ""
     @State private var isPasswordVisible = false
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     @State private var showMainPage = false
     var body: some View {
        VStack {
            
            Text("Ingrese el correo electrónico asociado con su cuenta y le enviaremos un correo electrónico con instrucciones para restablecer la contraseña")
                .multilineTextAlignment(.center)
            .padding(.horizontal,40)
            .padding(.bottom,60)
            Image(systemName:"envelope")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .frame(width:300,height: 100)
                .padding(.bottom,20)
            Text("Revisa tu correo")
                .font(.title)
                .padding(.bottom,20)
                .foregroundColor(.blue)
            Text("Hemos enviado un correo can tus nuevas credenciales")
                .padding(.horizontal,70)
                .multilineTextAlignment(.center)
                .padding(.bottom,30)
               
            Spacer()
            Button(action: {
                // Perform registration action here
                showMainPage = true
            }) {
                Text("Aceptar")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showMainPage) {
                NavigationView{
                    ContentView()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Recupera tu contrasena")
                    .font(.headline) // increase size
                    .foregroundColor(.blue) // change color to blue
            }
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
       
    }
     
}

struct RecoverMailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecoverMailView()
        }
    }
}
