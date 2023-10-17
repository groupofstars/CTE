
import SwiftUI
 struct DetailedGood: View {
    @State private var selectedItem = false
     
     var passedString: String
     init(passedString: String) {
            self.passedString = passedString
     }
     
    
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        GeometryReader { geometry in
            VStack (alignment: .leading){
                Text("Televisores")
                    .font(.title)
                    .padding()
                    .foregroundColor(.blue)
                    

                ScrollView {
                    Button(action: {
                        selectedItem=true;
                    }) {
                        HStack {
                            Image(passedString)
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
                                Image("heart_gray")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.blue)
                                    .frame(width: geometry.size.width / 14, height: geometry.size.width / 14)
                                Spacer()
                                Image("share_gray")
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
                            AddPackage(passedString: passedString)
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
            
        }
    }
}
 struct DetailedGood_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailedGood(passedString: "TV2")
        }
    }
}
