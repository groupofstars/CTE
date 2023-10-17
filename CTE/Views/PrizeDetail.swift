import SwiftUI
struct PrizeDetail: View {
     @State private var selectedItem = false
     @State var cartItemCount:Int = 1
     @State var selection:Int = 0
     @State  var inputText = ""
    @State var gotoCard=false;
    let options = ["1", "2", "5","10","20","50","100"]
     
     var passedString: String

     init(passedString: String) {
            self.passedString = passedString
     }
     
    @State private var showAlert = false
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject private var rafflesViewModel = RafflesViewModel()
    let id:Int=1
    
     var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                VStack (alignment: .leading){
                    ScrollView {
                        if let firstRaffle = rafflesViewModel.raffles.first {
                            
                            
                            LazyVStack {
                                
                                AsyncImage(url:URL(string:firstRaffle.coverImageUrl)){ phase in
                                    if let image = phase.image {
                                        image // Displays the loaded image.
                                            .resizable()
                                    } else if phase.error != nil {
                                        Color.red // Indicates an error.
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 4)
                                
//                                Image(passedString)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
                                
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Los 40 y Coca Cola")
                                        Text("te invitan al Flow Fest 2023")
                                    }
                                    .foregroundColor(.blue)
                                    Spacer()
                                }
                                .padding()
                                
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt, mi ut consectetur mentum, lacus odio bibendum eros, et fementum purus est sit amet sapien. Duis varius ante vel ex pretium, nec venenatis eros aliquam. ")
                                
                                Text("Condiciones del Sorteo")
                                    .fontWeight(.bold)
                                    .padding(.top)
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt, mi ut consectetur mentum, lacus odio bibendum eros, et fementum purus est sit amet sapien. Duis varius ante vel ex pretium, nec venenatis eros aliquam.")
                                    .padding(.top,5)
                                Text("Completa los siguientes campos:")
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                Group{
                                    Group{
                                        HStack{
                                            Text("Nombres")
                                            Spacer()
                                        }
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .background(
                                                .gray
                                                //                                    LinearGradient(
                                                //                                        gradient: Gradient(colors: [.white,.white,.white, .gray]),
                                                //                                        startPoint: .top,
                                                //                                        endPoint: .bottom
                                                //                                    )
                                            )
                                            .cornerRadius(10)
                                    }
                                    Group{
                                        HStack{
                                            Text("Apellido Paterno")
                                            Spacer()
                                        }
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .background(
                                                .gray
                                            )
                                            .cornerRadius(10)
                                    }
                                    Group{
                                        HStack{
                                            Text("Apellido Materno")
                                            Spacer()
                                        }
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .background(
                                                .gray
                                            )
                                            .cornerRadius(10)
                                    }
                                    Group{
                                        HStack{
                                            Text("DNI")
                                            Spacer()
                                        }
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .background(
                                                .gray
                                            )
                                            .cornerRadius(10)
                                    }
                                }
                                Group{
                                    Group{
                                        HStack{
                                            Text("Pregunta 1 ¿Lorem ipsum dolor sit amet redo?")
                                            Spacer()
                                        }
                                        .padding(.top)
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                        
                                            .cornerRadius(10)
                                    }
                                    Group{
                                        HStack{
                                            Text("Pregunta 2 ¿Lorem ipsum dolor sit amet redo?")
                                            Spacer()
                                        }
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                            .cornerRadius(10)
                                    }
                                    Group{
                                        HStack{
                                            Text("Pregunta 3 ¿Lorem ipsum dolor sit amet redo?")
                                            Spacer()
                                        }
                                        TextField("Enter value", text: $inputText)
                                        //                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding()
                                            .keyboardType(.numberPad)
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    .padding()
                    Spacer()
                    HStack{
                        Button(action: {
                            showAlert=true;
                        }) {
                            Text("Participar")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
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
                        .fullScreenCover(isPresented: $showAlert) {
                            NavigationView{
                                SuccessPan(passedString: "¡Felicitaciones!\nYa estás participando")
                            }
                        }
                      
                    }
                    .padding()
                    
                }
                .onAppear {
                    rafflesViewModel.getRaffleByID(id:id)
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
                
            }

        }
    }
    
}

struct PrizeDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PrizeDetail(passedString: "los")
        }
    }
}
