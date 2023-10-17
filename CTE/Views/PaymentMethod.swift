import SwiftUI
 struct PaymentMethod: View {
     @State private var mail = ""
     @State private var isPasswordVisible = false
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     @State private var showMainPage = false
     
     var passedString: String
     init(passedString: String) {
            self.passedString = passedString
     }
     var body: some View {
         VStack{
             ScrollView{
                 VStack {
                     
                     
                     HStack{
                         Spacer()
                         Image(systemName: "chevron.forward")
                        
                     }
                     .padding()
                     .background(
                        Image("visa")
                            .resizable()
                            .frame(width: .infinity, height: 80)
                        
                     )
//                     .padding()
                     .background(
                         RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 0.5)
                     )
                     .padding()
                     
                     HStack{
                         Spacer()
                         Image(systemName: "chevron.forward")
                        
                     }
                     .padding()
                     .background(
                        Image("cap_visa_small")
                            .resizable()
                            .frame(width: .infinity, height: 80)
                     )
                     .padding()
                     
                     HStack{
                         Text("Pago en tienda")
                             .padding(.horizontal)
                         Spacer()
                         Image(systemName: "chevron.forward")
                        
                     }
                     .padding()
                     .frame(width: .infinity, height: 80)
                     .background(
                         RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 0.3)
                     )
//                     .foregroundColor(.clear)
                     .padding(.horizontal)
                     
                     HStack{
                         Spacer()
                         Image(systemName: "chevron.forward")

                     }
                     .padding()
                     .frame( height: 80)
                     .background(
                        Image("pago")
                            .resizable()
                            .frame(width: .infinity, height: 80)
                     )
                     .background(
                         RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 0.5)
                     )
//                     .foregroundColor(.clear)
                     .padding(.horizontal)
                     
                     HStack{
                         Text("Transferencia Bancaria")
                             .padding(.horizontal)
                         Spacer()
                         Image(systemName: "chevron.forward")
                        
                     }
                     .padding()
                     .frame(width: .infinity, height: 80)
                     .background(
                         RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 0.3)
                     )
//                     .foregroundColor(.clear)
                     .padding(.horizontal)
                     
                     
                     
                 }
                 .toolbar {
                     ToolbarItem(placement: .principal) {
                         Text("Método de pago")
                             .font(.title) // increase size
                             .foregroundColor(.blue) // change color to blue
                     }
                 }
                 .navigationBarItems(leading: Button(action: {
                     self.presentationMode.wrappedValue.dismiss()
                 }) {
                     Image(systemName: "arrow.left")
                         .foregroundColor(.blue)
                 })
                 
             }
             
             Spacer()
             Button(action: {
                 // Perform registration action here
                 showMainPage = true
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
             .fullScreenCover(isPresented: $showMainPage) {
                 NavigationView{
                     PaymentAddCard(passedString: passedString)
                 }
             }
             .padding(.horizontal)
             .padding(.bottom, 30)
         }
         
    }
     
}


struct PaymentMethod_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PaymentMethod(passedString: "Sample String")
        }
    }
}
