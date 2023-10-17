import SwiftUI
 struct RegisterView: View {
     
     
     @State private var showVerifyCodeView = false
//     @State private var gender: Gender = .male
     
     
     @StateObject private var registrationViewModel = RegistrationViewModel()
     @State private var names = ""
     @State private var paternalSurname = ""
     @State private var maternalSurname = ""
     @State private var gender = ""
     @State private var nationalId = ""
     @State private var address = ""
     @State private var email = ""
     @State private var mobilePhone = ""
     @State private var companyId = ""
     
//
     @State private var instituciones = [String: Int]()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     enum Gender {
        case male, female, other
    }
     
     @StateObject private var companyViewModel = CompanyViewModel()
     
     var body: some View {
        VStack {
            TextField("Nombres", text: $names)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
                        
            TextField("Apellido Paterno", text: $paternalSurname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("Apellido Materno", text: $maternalSurname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
             HStack {
                 Text("Male")
                RadioButton(selected: $gender, value: "MALE")
                     .padding(.horizontal)
                Text("Female")
                RadioButton(selected: $gender, value: "FEMALE")
                     .padding(.horizontal)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            TextField("DNI", text: $nationalId)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .padding(.bottom, 10)
            TextField("DIRECCIÓN", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        
            TextField("Correo electrónico", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextField("Celular", text: $mobilePhone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            Picker("Nothing", selection: $companyId) {
                
                ForEach(companyViewModel.companies.data) { company in
                    Text(company.name)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            instituciones[company.name] = company.id
                            companyId = company.name
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .border(Color.blue, width: 2)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .pickerStyle(DefaultPickerStyle())
            
            
            
            Button(action: {
                // Perform registration action here
//                let genderString = switch gender {
//                    case.male: "MALE"
//                    case.female: "FEMALE"
//                }
                registrationViewModel.registerUser(
                    names: names,
                    paternalSurname: paternalSurname,
                    maternalSurname: maternalSurname,
                    gender: gender,
                    nationalId: nationalId,
                    address: address,
                    email: email,
                    mobilePhone: mobilePhone,
                    companyId: instituciones[companyId]!
                )
                
            }) {
                Text("Confirm")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $showVerifyCodeView) {
               NavigationView{
                   VerifyCodeView()
//                            .navigationBarHidden(false)
               }
           }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .onAppear {
            companyViewModel.fetchCompanies()
        }
        .padding()
//        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Registro")
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
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showVerifyCodeView) {
            VerifyCodeView()
        }
        .alert(isPresented: $registrationViewModel.isRegistered) {
            Alert(
                title: Text("Registration Successful"),
                message: nil,
                dismissButton: .default(Text("OK"),action:{
                    showVerifyCodeView = true
                })
            )
            
        }
    }
     
}
struct RadioButton: View {
    @Binding var selected: String
    let value: String
     var body: some View {
        Button(action: {
            selected = value
        }) {
            Image(systemName: selected == value ? "largecircle.fill.circle" : "circle")
                .foregroundColor(selected == value ? .blue : .gray)
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}
