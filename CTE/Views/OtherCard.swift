
import SwiftUI
 struct OtherCard: View {
    @State private var selectedItem = false
     @State private var selectTab=true
     @State private var buy=false
//     var passedString: String
//     init(passedString: String) {
//            self.passedString = passedString
//     }
     
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                Text("Otros Beneficios")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                    
                
                ScrollView {
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
                                        .cornerRadius(10)
                                    VStack(alignment: .leading){
                                        Text("Chinabox Honey \nChicken + Arroz chaufa \nde pollo ")
                                            .multilineTextAlignment(.leading)
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
                                    OtherDetail(passedString:"inca")
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


struct OtherCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OtherCard()
        }
    }
}
