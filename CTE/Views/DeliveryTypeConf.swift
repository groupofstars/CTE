
import SwiftUI
 struct DeliveryTypeConf: View {
     @State private var selectedItem = false
     @State private var selectTab=true
     @State private var buy=false
     let department=["Electonic","Hogar"]
     @State private var sel_depart = "Institucion A"
     @State private var address = ""
     @State private var phone = ""
     @State private var email = ""
//     var passedString: String
//     init(passedString: String) {
//            self.passedString = passedString
//     }
     @State private var selectedOption: String = ""
     
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                Text("Tipo de Entrega")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                HStack{
                    VStack(alignment: .leading){
                        Text("Casa Familia")
                            .foregroundColor(.blue)
                            .font(.system(size:geometry.size.width/20))
                            .padding(.vertical,1)
                            .fontWeight(.bold)
                        Text("Sergio Barrios")
                            .foregroundColor(.black)
                            .font(.system(size:geometry.size.width/20))
                            .fontWeight(.bold)
                            .padding(.bottom,1)
                        Text("Teniente Carlos Moore 1352")
                            .foregroundColor(.black)
                            .font(.system(size:geometry.size.width/22))
                        Text("LIMA - LIMA")
                            .foregroundColor(.black)
                            .font(.system(size:geometry.size.width/22))
                        Text("Cercado de Lima")
                            .foregroundColor(.black)
                            .font(.system(size:geometry.size.width/22))
                        HStack{
                            VStack(alignment:.leading){
                                Text("997845742")
                                    .foregroundColor(.black)
                                    .font(.system(size:geometry.size.width/22))
                                Text("serigio@mail.com")
                                    .foregroundColor(.black)
                                    .font(.system(size:geometry.size.width/22))
                            }
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.system(size:geometry.size.width/15))
                        }
                        
                        
                    }
                    Spacer()
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                .padding()
                HStack{
                    Text("Editar Direccion")
                    Spacer()
                    Text("Crear dirección")
                        .underline()
                }
                .padding(.horizontal)
//                TextEditor(text: /*@START_MENU_TOKEN@*/.constant("Placeholder")/*@END_MENU_TOKEN@*/)
                ZStack(alignment: .topLeading) {
                    
                    TextEditor( text: $address)
                        .lineLimit(nil)
                        .frame(maxHeight: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                    //                    .foregroundColor(.clear)
                        .padding(.top)
                        .padding(.horizontal)
                    if address.isEmpty {
                        Text("Ingresa tus indicaciones de envío o la persona para recibir la compra")
                            .foregroundColor(.gray)
                            .padding()
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                }
////                TextField("Ingresa tus indicaciones de envío o la persona para recibir la compra", text: $address)
//                    .lineLimit(nil)
//                    .frame(maxHeight: .infinity)
//                    .padding()
//
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 2)
//                    )
////                    .foregroundColor(.clear)
//                    .padding(.top)
//                    .padding(.horizontal)
                Text("Fecha de entrega")
                    .padding(.horizontal)
                    .padding(.top,8)
                    .fontWeight(.bold)
                Text("Selecciona tu fecha de entrega:")
                    .padding(.horizontal)
//                    .padding(.top,1)
                
                ScrollView {
                    HStack(alignment:.center){
                        Spacer()
                        RadioButtonView(option: "Mar  4 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Mie  5 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Jue  6 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Vie  7 Abr", selectedOption: $selectedOption)
                        Spacer()
                    }
                    HStack(alignment:.center){
                        Spacer()
                        RadioButtonView(option: "Mar  8 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Mie  9 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Jue 10 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Vie 11 Abr", selectedOption: $selectedOption)
                        Spacer()
                    }
                    HStack(alignment:.center){
                        Spacer()
                        RadioButtonView(option: "Mar 12 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Mie 13 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Jue 14 Abr", selectedOption: $selectedOption)
                        RadioButtonView(option: "Vie 15 Abr", selectedOption: $selectedOption)
                        Spacer()
                    }
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
                        PaymentMethod(passedString: "Tu compra ha sido exitosa")
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
struct RadioButtonView: View {
    let option: String
    @Binding var selectedOption: String
    

    var body: some View {
        Button(action: {
            selectedOption = option
        }) {
            VStack(alignment:.center) {
                TextField("d",text: $selectedOption)
                Text(option)
                    .font(.system(size:UIScreen.main.bounds.width / 30))
                    .padding(.vertical,UIScreen.main.bounds.width/66)
                HStack{
                    Image(systemName: selectedOption == option ? "largecircle.fill.circle" : "circle")
                    Text("S/9")
                        .font(.system(size:UIScreen.main.bounds.width / 30))
                        .padding(.vertical,UIScreen.main.bounds.width/66)
                }
//                .padding()
            }
            .padding(UIScreen.main.bounds.width/75)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedOption == option ? Color.cyan:Color.gray, lineWidth: 2)
            )
        }
        .foregroundColor(.primary)
       
    }
}
 struct DeliveryTypeConf_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DeliveryTypeConf()
        }
    }
}
