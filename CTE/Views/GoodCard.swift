
import SwiftUI
 struct GoodCard: View {
    @State private var selectedItem = false
     @State private var selectTab=true
     @State private var buy=false
//     var passedString: String
     init(selectedTab: Bool = false) {
         self.selectTab = selectedTab
     }
     
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     
     @State var value = ""
     var placeholder = "Select Client"
     var dropDownList = ["PSO", "PFA", "AIR", "HOT"]
     
     
     var options: [DropdownOption] = [
         DropdownOption(key: "1", value: "1"),
         DropdownOption(key: "2", value: "2"),
         DropdownOption(key: "3", value: "3"),
         DropdownOption(key: "4", value: "4"),
         DropdownOption(key: "5", value: "5"),
         DropdownOption(key: "10", value: "10"),
         DropdownOption(key: "20", value: "20"),
         DropdownOption(key: "50", value: "50"),
         DropdownOption(key: "100", value: "100")
     ]


     @State var text1 = ""
     
     var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                Text("Carrito de compras")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                    
                HStack {
                    // your buttons here...
                    Button(action: {
                        self.selectTab = true
                    }) {
                        
                            Text("Productos")
                            .padding()
                       
                    }
                    .opacity(selectTab  ? 1 : 0.5)
                    
                    Button(action: {
                        self.selectTab = false
                    }) {
                        
                            Text("Beneficios")
                            .padding()
                        
                    }
                    .opacity(selectTab == false ? 1 : 0.5)
                    
                }
                .padding(.horizontal)
                ScrollView {
                    if(selectTab){
                        VStack{
                            Button(action: {
                                selectedItem=true;
                            }) {
                                HStack {
                                    Image("TV")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width / 5, height: geometry.size.width / 5)
                                        .padding()
                                        .border(Color.gray, width: 2)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    VStack(alignment: .leading){
                                        Text("TV LG UHD 55\' 4K")
                                        Text("Smart ThinQ AI")
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
                                    .frame(width: geometry.size.width/2)
                                    
                                    
//                                    VStack{
//                                        Image("heart_white_blue")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .foregroundColor(.blue)
//                                            .frame(width: geometry.size.width / 14, height: geometry.size.width / 14)
//
//                                        Image("share_white_blue")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .foregroundColor(.blue)
//                                            .frame(width: geometry.size.width / 14, height: geometry.size.width / 14)
//
//                                    }
                                    
                                }
                            }
                            .fullScreenCover(isPresented: $selectedItem) {
                                NavigationView{
                                    DeliveryType()
                                }
                            }
                            Group {
                               
                                DropDown(
                                    textppp:$text1,
                                    placeholder: "1",
                                    options: options,
                                    onOptionSelected: { option in
                                        print(option)
                                })
                               
                            }
                            .padding(.horizontal)
                            .padding(.horizontal)
                        }
                    }
                    else{
                        VStack{
                            Button(action: {
                                selectedItem=true;
                            }) {
                                HStack {
                                    Image("inca")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width / 5, height: geometry.size.width / 5)
                                        .padding()
                                        .border(Color.gray, width: 2)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    VStack(alignment: .leading){
                                        Text("TV LG UHD 55\' 4K")
                                        Text("Smart ThinQ AI")
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
                                    .frame(width: geometry.size.width/2)
                                    VStack{
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .foregroundColor(.black)
                                            .frame(width: geometry.size.width / 15, height: geometry.size.width / 15)
                                        Spacer()
                                        Image("share")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .foregroundColor(.blue)
                                            .frame(width: geometry.size.width / 14, height: geometry.size.width / 14)
                                        Spacer()
                                        
                                    }
                                    
                                }
                            }
                            .fullScreenCover(isPresented: $selectedItem) {
                                NavigationView{
//                                    AddPackage(passedString: passedString)
                                }
                            }

                        }
                    }
                    
                }
                .padding()
                Spacer()
                Button(action: {
                    // Perform registration action here
                    buy = true
                }) {
                    Text("Comprar")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $buy) {
                    NavigationView{
                        DeliveryType()
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
 struct GoodCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            GoodCard(selectedTab: true)
        }
    }
}
