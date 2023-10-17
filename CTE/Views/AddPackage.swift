import SwiftUI
struct AddPackage: View {
     @State private var selectedItem = false
     @State var cartItemCount:Int = 1
     @State var selection:Int = 0
     @State  var inputText = "1"
    @State var gotoCard=false;
    let options = ["1", "2", "5","10","20","50","100"]
     
     var passedString: String
     
     init(passedString: String) {
            self.passedString = passedString
     }
     
    @State private var showAlert = false
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                
                VStack (alignment: .leading){
                    
                    ScrollView {
                        
                        VStack {
                            Image(passedString)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 1.2)
                                .padding()
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("TV LG UHD 55\' 4K")
                                    Text("Smart ThinQ AI")
                                }
                                Spacer()
                                HStack{
                                    Image("heart_white_blue")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .foregroundColor(.blue)
                                        .frame(width: geometry.size.width / 14, height: geometry.size.width / 14)
                                    
                                    Image("share_white_blue")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .foregroundColor(.blue)
                                        .frame(width: geometry.size.width / 14, height: geometry.size.width / 14)
                                    
                                    
                                }
                                
                            }
                            .frame(width: geometry.size.width/1.2)
                            HStack{
                                VStack(alignment: .leading){
                                    Text("55UQ7950PSB")
                                    Text("Marca 1")
                                        .foregroundColor(.gray)
                                    HStack{
                                        Text("S/ 1300.00")
                                            .font(.system(size:12))
                                            .foregroundColor(.blue)
                                            .strikethrough(true, color: .red)
                                        Text("S/ 1040.00")
                                            .foregroundColor(.blue)
                                    }
                                }
                                Spacer()
                            }
                            .frame(width: geometry.size.width/1.2)
                            Text("Ten una calidad de imagen deslumbrante gracias a la nueva TV modelo 4K UHD con sistema Smart que LG tiene para ti.")
                                .padding(.top)
                            Text("Terminos y condiciones")
                                .fontWeight(.bold)
                                .padding(.top)
                            Text("Lorem ipsum dolor sit armet, consectetur adipiscing elit. Nulla faucibus lorem, gravida consequat nisi gravida sit armet.")
                                .padding(.top,5)
                        }
                        
                    }
                    .padding()
                    Spacer()
                    HStack{
                        
                        
                        
                        TextField("Enter value", text: $inputText)
                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [.white,.white,.white, .gray]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .cornerRadius(10)
                        
                        
                        VStack {
                            Button(action: {
                                withAnimation {
                                    showAlert.toggle()
                                }
                            }) {
                                Text("Añadir la carro")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.white, .blue, .blue]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .cornerRadius(10)
                            }
                        }
                        
                        
                        
                        
                        
                        
                        //                    .background(.blue)
                        //                    .foregroundColor(.white)
                    }
                    .padding()
                    
                }
                
                //            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                    
                })
                .navigationBarItems(trailing:
                                        ZStack {
                    Button(action: {
                        // Handle cart button action
                    }) {
                        Image(systemName: "cart")
                    }
                    
                    if cartItemCount > 0 {
                        Text("\(cartItemCount)")
                            .foregroundColor(.white)
                            .font(.caption)
                            .padding(5)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
                )
//                .opacity(showAlert ? 0.1:1)
                .overlay(Color.black.opacity(showAlert ? 0.6:0))
                
                if showAlert {
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(.thickMaterial)
//                        .frame(width: geometry.size.width/1.2, height: geometry.size.height/1.2)
//                        .transition(.scale)
                    VStack {
                        Text("Tu producto fue añadido")
                            .padding(.top,geometry.size.height/20)
                            .padding(.bottom,geometry.size.height/50)
                            .font(.system(size:geometry.size.width/24))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Image(passedString)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 1.4)
                            .padding()
                        
                        Text("TV LG UHD 55\' 4K")
                        HStack{
                            Text("ThinQ AI")
                            Text("55UQ7950PSB")
                        }
                        HStack{
                                Text("S/ 1300.00")
                                    .font(.system(size:12))
                                    .foregroundColor(.blue)
                                    .strikethrough(true, color: .red)
                                Text("S/ 1040.00")
                                    .foregroundColor(.blue)
                        }
                        .padding(.top)
//                            .frame(width: geometry.size.width/1.2)
                        Button(action: {
                            gotoCard=true;
                        }) {
                            Text("Ir al carro")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                
                                
                        }
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.white, .blue, .blue]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .fullScreenCover(isPresented: $gotoCard) {
                            NavigationView{
                                GoodCard(selectedTab: true)
                            }
                        }
                        Button(action: {
                            withAnimation {
                                showAlert.toggle()
                            }
                        }) {
                            Text("Seguir comprando")
                                .underline()
                        }
                        .foregroundColor(.gray)
                        .padding(geometry.size.height/30)
                    }
                    .background(.white)
                    .transition(.scale)
                    .cornerRadius(20)
                    .frame(width: geometry.size.width/2)
//                    .frame(width: geometry.size.width/2, height: geometry.size.height/1.2)
                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        // Handle back button action
//                    }) {
//                        Image(systemName: "chevron.left")
//                    }
//                }
//
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        // Handle cart button action
//                    }) {
//                        Image(systemName: "cart")
//                    }
//                }
//            }
        }
    }
    
}

struct AlertContent: View {
    var body: some View {
        VStack {
            Image("yourImageName")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("This is a custom alert message.")
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}
 struct AddPackage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddPackage(passedString: "TV2")
        }
    }
}
