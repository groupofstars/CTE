
import SwiftUI
 struct DeliveryType: View {
     @State private var selectedItem = false
     @State private var selectTab=true
     @State private var buy=false
     @State private var buy1=false
     let department=["Lima","Hogar"]
     let provinca=["Provinca","Hogar"]
     
     let selection21=["LIMA","Hogar"]
     let selection22=["LIMA","Hogar"]
     let selection23=["Lockers","Hogar"]
     
     @State private var sel_depart = ""
     @State private var sel_provincia = ""
     @State private var sel_direccion = ""
     @State private var sel_tipo = ""
     
     @State private var address = ""
     @State private var phone = ""
     @State private var email = ""
     
     @State private var nombres = ""
     @State private var dni = ""
     @State private var phone1 = ""
//     var passedString: String
//     init(passedString: String) {
//            self.passedString = passedString
//     }
     @State private var buy_cancel=true;
     
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                Text("Tipo de Entrega")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    
                HStack {
                    // your buttons here...
                    Button(action: {
                        self.selectTab = true
                    }) {
                        
                            Text("Despacho a domicilio")
                            .padding()
                            .foregroundColor(.black)
                       
                    }
                    .opacity(selectTab  ? 1 : 0.5)
                    
                    Button(action: {
                        self.selectTab = false
                    }) {
                        
                            Text("Retiro en tienda, lockers y puntos autorizados")
                            .padding()
                            .foregroundColor(.black)
                        
                    }
                    .opacity(selectTab == false ? 1 : 0.5)
                    
                }
                .padding(.horizontal)
                ScrollView {
                    if(selectTab) {
                        Group{
                            HStack{
                                Text(" Nombre Dirección")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            
                            TextField("Nombre Dirección", text: $address)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
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
                            
                            HStack{
                                Text(" Departamento")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            Picker("Institucion", selection: $sel_depart) {
                                ForEach(department, id: \.self) {
                                    Text($0)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            .frame(maxWidth: .infinity)
//                            .border(Color.blue, width: 2)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .pickerStyle(DefaultPickerStyle())
                            
                            HStack{
                                Text(" Provincia")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            Picker("Institucion", selection: $sel_provincia) {
                                ForEach(provinca, id: \.self) {
                                    Text($0)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
//                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                        Group{
                            HStack{
                                Text(" Dirección")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            TextField("Dirección", text: $address)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
                            HStack{
                                Text(" Celular")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            TextField("Celular", text: $phone)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
                            HStack{
                                Text(" Email")
                                    .font(.system(size:geometry.size.width/30))
                                Spacer()
                            }.padding(.horizontal)
                            TextField("Email", text: $email)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
                        }
                        
                    }
                    else{
                        Picker("Institucion", selection: $sel_depart) {
                            ForEach(department, id: \.self) {
                                Text($0)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        .pickerStyle(DefaultPickerStyle())
                        
                        Picker("Institucion", selection: $sel_depart) {
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
//                            HStack{
//                                Text(" Dirección")
//                                    .font(.system(size:geometry.size.width/30))
//                                Spacer()
//                            }.padding(.horizontal)
                        TextField("Dirección", text: $address)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        
                        Picker("Institucion", selection: $sel_tipo) {
                            ForEach(selection23, id: \.self) {
                                Text($0)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        .pickerStyle(DefaultPickerStyle())
                        
                        if(sel_tipo=="Lockers"){
                            VStack(alignment:.leading){
                                Text("¿Quién retiratá la compra?")
                                Button(action: {
                                    buy_cancel = true
                                }) {
                                    HStack{
                                        Image(systemName: buy_cancel  ? "largecircle.fill.circle" : "circle")
                                        Text("Yo, Retirare la compra")
                                            .font(.system(size:UIScreen.main.bounds.width / 30))
                                            .padding(.vertical,UIScreen.main.bounds.width/66)
                                    }
                                }
                                Button(action: {
                                    buy_cancel = false
                                }) {
                                    HStack{
                                        Image(systemName: !buy_cancel ? "largecircle.fill.circle" : "circle")
                                        Text("Otra persona retirará")
                                            .font(.system(size:UIScreen.main.bounds.width / 30))
                                            .padding(.vertical,UIScreen.main.bounds.width/66)
                                    }
                                }
                                
                            }
                            if(buy_cancel==false){
                                Group{
                                    HStack{
                                        Text(" Nombre Completo")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    TextField("Nombre Completo", text: $nombres)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                    
                                    HStack{
                                        Text(" DNI")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    TextField("DNI", text: $dni)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                    
                                    HStack{
                                        Text(" Celular")
                                            .font(.system(size:geometry.size.width/30))
                                        Spacer()
                                    }.padding(.horizontal)
                                    TextField("Celular", text: $phone1)
                                        .padding()
                                        .background(Color(.systemGray6))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                                        .padding(.bottom, 10)
                                    
                                }
                            }
                        }
                    }
                    
                }
                .padding()
                Spacer()
                if(selectTab) {
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
                            DeliveryTypeConf()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
                else{
                    Button(action: {
                        // Perform registration action here
                        buy1 = true
                    }) {
                        Text("Guardar")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: $buy1) {
                        NavigationView{
                            DeliveryTypeConf()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
                
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
 struct DeliveryType_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DeliveryType()
        }
    }
}
