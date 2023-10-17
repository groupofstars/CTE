
import SwiftUI
 struct PaymentAddCard: View {
     @State private var selectedItem = false
     @State private var selectTab=true
     @State private var buy=false
     let department=["DNI del titulr de la tarjeta","Hogar"]
     @State private var sel_depart = "Institucion A"
     @State private var address = ""
     @State private var phone = ""
     @State private var email = ""
     
     var passedString: String
     init(passedString: String) {
            self.passedString = passedString
     }
     
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                Text("Agregar Tarjeta")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                    
               
                ScrollView {
                            HStack{
                                Text(" Numero de tarjeta")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)

                            TextField("Numero de tarjeta", text: $address)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            HStack{
                                VStack{
                                    HStack{
                                        Text(" MM/AA")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    TextField("MM/AA", text: $address)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                  
                                }
                                VStack{
                                    HStack{
                                        Text(" CVV")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    TextField("CVV", text: $address)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
//                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                    
                                }
                                Image(systemName: "questionmark.circle.fill")
                            }
                            
                            HStack{
                                VStack{
                                    HStack{
                                        Text(" Nombres")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    TextField("Nombres", text: $address)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                  
                                }
                                VStack{
                                    HStack{
                                        Text(" Apellidos")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    
                                    TextField("Apellidos", text: $address)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                                .padding(.horizontal)
                                        .padding(.bottom, 10)
                                    
                                }
                            }
                            Picker("DNI", selection: $sel_depart) {
                                ForEach(department, id: \.self) {
                                    Text($0)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            
                            HStack{
                                Text(" Nro Documeto")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            TextField("Nro Documeto", text: $address)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            
                 

                    
                }
                .padding()
                Spacer()
                Button(action: {
                    // Perform registration action here
                    buy = true
                }) {
                    Text("Guardar")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $buy) {
                    NavigationView{
                        PaymentCheck(passedString: passedString)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                
                
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)
            })
            
        }
    }
}


struct PaymentAddCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PaymentAddCard(passedString: "Sample String")
        }
    }
}
//TextField("Enter text", text: $address)
//    .padding()
//    .background(
//        RoundedRectangle(cornerRadius: 10)
//            .stroke(Color.gray, lineWidth: 2)
//    )
////                    .foregroundColor(.clear)
//    .padding(.top)
//    .padding(.horizontal)
