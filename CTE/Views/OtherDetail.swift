import SwiftUI
struct OtherDetail: View {
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
    @State private var next = false
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
           
            VStack{
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
                                    Text("Combo WHOPPER®\ncon Queso")
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
                                    
                                    Text("Marca 1")
                                        .foregroundColor(.gray)
                                    HStack{
                                        Text("S/ 19.00")
                                            .font(.system(size:12))
                                            .foregroundColor(.blue)
                                            .strikethrough(true, color: .red)
                                        Text("S/ 14.00")
                                            .foregroundColor(.blue)
                                    }
                                }
                                Spacer()
                            }
                            .frame(width: geometry.size.width/1.2)
                            Text("Hamburguesa grande a la parrilla con queso, tomates, lechuga, mayonesa, ketchup, pepinillos y aros de cebolla, 1 papa personal 1 gaseosa personal. Imagen referencial")
                                .padding(.top)
                            Text("Términos y condiciones")
                                .fontWeight(.bold)
                                .padding(.top)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus faucibus lorem, gravida consequat nisl gravida sit amet.")
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
                    //                                     RoundedRectangle(cornerRadius: 20)
                    //                                         .fill(.thickMaterial)
                    //                                         .frame(width: 350, height: 120)
                    //                                         .transition(.scale)
                    VStack{
                        HStack{
                            Button(action:{
                                withAnimation {
                                    showAlert.toggle()
                                }
                            }){
                                Image(systemName: "multiply")
                            }
                            .padding()
                            Spacer()
                        }
                        Text("¡Agregado!")
                            .font(.system(size:UIScreen.main.bounds.width/17))
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

                        
                        Button(action:{
                            next=true;
                        }){
                            Text("Comprar")
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .background(
                                    .blue
                                )
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                        .fullScreenCover(isPresented: $next) {
                            NavigationView{
                                GoodCard(selectedTab: false)
                            }
                        }
                        
                        
                        
                        
                    }
                    .background(.white)
                    .transition(.scale)
                    .cornerRadius(20)
                    
                }
            }
          
        }
    }
    
}



struct OtherDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OtherDetail(passedString: "inca")
        }
    }
}
