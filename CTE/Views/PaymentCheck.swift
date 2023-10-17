
 import SwiftUI
 struct PaymentCheck: View {
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
                Text("Checkout")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                    
               
                ScrollView {
                    HStack{
                        Text(" Metodo de Page")
                            .font(.system(size:geometry.size.width/30))
                        Spacer()
                    }.padding(.horizontal)
                    HStack{
                        Spacer()
                        Text("***********7077")
                        Spacer()
                        Image(systemName: "chevron.forward")
                       
                    }
                    .padding()
                    .background(
                       Image("visa1")
                           .resizable()
                           .frame(width: .infinity, height: geometry.size.width/5)
                    )
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                           .stroke(Color.gray, lineWidth: 0.5)
                    )
//                     .foregroundColor(.clear)
//                    .padding(.horizontal)
                    VStack(alignment:.leading){
                        HStack{
                            Text("Detalles de Compra")
                                .font(.system(size:geometry.size.width/26))
                                .fontWeight(.bold)
                            Spacer()
                        }.padding(.horizontal)
                        HStack{
                            Text("TV LG UHD 55' 4K Smart")
                                .font(.system(size:geometry.size.width/26))
                            Spacer()
                        }.padding(.horizontal)
                            .padding(.top,1)
                        HStack{
                            Text("ThinQ AI 55UQ7950PSB")
                                .font(.system(size:geometry.size.width/26))
                            Spacer()
                            Text("1300")
                        }.padding(.horizontal)
                        HStack{
                            Text("Enmvio")
                                .font(.system(size:geometry.size.width/26))
                            Spacer()
                            Text("9")
                        }.padding(.horizontal)
                            .padding(.top,1)
                        HStack{
                            Text("Descuento Promo")
                                .font(.system(size:geometry.size.width/26))
                            Spacer()
                            Text("-260")
                        }.padding(.horizontal)
                            .padding(.top,1)
                        HStack{
                            Text("Total")
                                .font(.system(size:geometry.size.width/26))
                                .fontWeight(.bold)
                            Spacer()
                            Text("1049.00")
                        }.padding(.horizontal)
                            .padding(.top,1)
                        
                        
                            Text("Detalles de Recojo")
                                .font(.system(size:geometry.size.width/26))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            .padding(.top,1)
                        
                            Text("LOCKER CANEVARO")
                                .font(.system(size:geometry.size.width/26))
                                .padding(.horizontal)
                                .padding(.top,1)
                       
                            Text("AV.Gral Canevaro 1598, Lince")
                                .font(.system(size:geometry.size.width/26))
                                .padding(.horizontal)
//                            .padding(.top,0.5)
                        
                            Text("(Dentro de Tienda Listo), Lince, Lima ")
                                .font(.system(size:geometry.size.width/26))
                                .padding(.horizontal)
                       
//                            Text("Horario de retiro:")
//                                .font(.system(size:geometry.size.width/26))
//                                .padding(.horizontal)
//
//
//                            Text("Lunes m")
//                                .font(.system(size:geometry.size.width/26))
//                                .padding(.horizontal)
                        
                    }
                    .padding()

                }
                .padding()
                Spacer()
                Button(action: {
                    // Perform registration action here
                    buy = true
                }) {
                    Text("Pagar")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.white, .blue, .blue]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $buy) {
                    NavigationView{
                        SuccessPan(passedString: passedString)
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



struct PaymentCheck_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PaymentCheck(passedString: "Sample string")
        }
    }
}
