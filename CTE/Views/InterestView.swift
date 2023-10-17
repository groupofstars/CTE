
import SwiftUI
 struct InterestView: View {
    @State private var showRegisterView = false
    @State private var username = ""
    @State private var password = ""
    @State private var isPasswordVisible = false // Track the state of the password visibility
     
     @StateObject private var interestsViewModel = InterestsViewModel()
     @State private var interests: [Bool] = [false,false,false,false,false,false,false,false]
     
     @State private var showSignUpSuccess = false
     
     @StateObject private var loginViewModel = LoginViewModel()
     
     var body: some View {
       
         
        VStack {
            Text("Selecciona tus intereses")
                .foregroundColor(.blue)
                .frame( height: 100)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
             
            Button(action: {
                interests[0].toggle()
            }) {
                HStack {
                    Image(systemName: interests[0] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[0] ? .blue : .gray)
                    Text("Hogar y Tecnologia")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[1].toggle()
            }) {
                HStack {
                    Image(systemName: interests[1] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[1] ? .blue : .gray)
                    Text("Restaurantes y entretenimiento")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[2].toggle()
            }) {
                HStack {
                    Image(systemName: interests[2] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[2] ? .blue : .gray)
                    Text("Vestuario y calzado")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[3].toggle()
            }) {
                HStack {
                    Image(systemName: interests[3] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[3] ? .blue : .gray)
                    Text("Beleza y cosmetica")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[4].toggle()
            }) {
                HStack {
                    Image(systemName: interests[4] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[4] ? .blue : .gray)
                    Text("Deportes y aventura")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[5].toggle()
            }) {
                HStack {
                    Image(systemName: interests[5] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[5] ? .blue : .gray)
                    Text("Salud y Bienestar")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[6].toggle()
            }) {
                HStack {
                    Image(systemName: interests[6] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[6] ? .blue : .gray)
                    Text("Educacion")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 10)
            Button(action: {
                interests[7].toggle()
            }) {
                HStack {
                    Image(systemName: interests[7] ? "checkmark.square.fill" : "square")
                        .foregroundColor(interests[7] ? .blue : .gray)
                    Text("Joyeria y Relojeria")
                    Spacer()
                }
            }
            .padding(.horizontal,40)
            .padding(.bottom, 40)
            
            
            
            Button(action: {
               // Perform sign-in action here
                interestsViewModel.updateInterests(interests: interests)
           }) {
               Text("Finalizar"    )
                   .foregroundColor(.white)
                   .padding()
                   .frame(maxWidth: .infinity)
                   .background(Color.blue)
                   .cornerRadius(10)
           }
           .fullScreenCover(isPresented: $showSignUpSuccess) {
               NavigationView{
                   SignUpSuccessView()
               }
           }
           .padding(.horizontal)
           .padding(.bottom, 10)
        }
        .padding()
        .onAppear{
            loginViewModel.login(username: username_signup, password: password_signup)
        }
        .alert(isPresented: $interestsViewModel.isUpdated) {
            Alert(
                title: Text("Interests Updated"),
                message: nil,
                dismissButton: .default(Text("OK"),action:{
                    showSignUpSuccess=true
                })
            )
        }
    }
}
 struct InterestView_Previews: PreviewProvider {
    static var previews: some View {
        
        InterestView()
    }
}
