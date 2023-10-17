
import SwiftUI
struct Discount: View {
    @State private var selectedItem = false
    @State private var selectTab=true
    @State private var buy=false
    let department=["DNI del titulr de la tarjeta","Hogar"]
    @State private var sel_depart = "Institucion A"
    @State private var address = ""
    @State private var phone = ""
    @State private var gotoAsis = false
    
    
//    var passedString: String
//    init(passedString: String) {
//           self.passedString = passedString
//    }
    
   
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
       GeometryReader { geometry in
           VStack (alignment: .leading){
               Text("Pago por Descuento por Planilla")
                   .font(.title)
                   .padding(.horizontal)
                   .padding(.horizontal)
                   .foregroundColor(.blue)
                   
              
               ScrollView {
                   
                   VStack(alignment:.leading){
                       HStack{
                           Text("Lorem ipsum dolor sit amet, consectetur adipicsing elit. Aliquam tincidunt, mi ut consectetur mentum, lacus odio bibendum eros, et fementum purus est sit met sapien. Duis varius ante vel ex pretium, nec venenatis eros aliquam.")
                               .font(.system(size:geometry.size.width/26))
                               .fontWeight(.bold)
                           Spacer()
                       }.padding(.horizontal)
                       HStack{
                           Text("Lorem ipsum dolor sit amet, consectetur adipicsing elit. Aliquam tincidunt, mi ut consectetur mentum, lacus odio bibendum eros, et fementum purus est sit met sapien. Duis varius ante vel ex pretium, nec venenatis eros aliquam.")
                               .font(.system(size:geometry.size.width/26))
                           Spacer()
                       }.padding(.horizontal)
                           .padding(.top,1)
                       
                       
                       
                   }
                   .padding()

               }
               .padding()
               Spacer()
               Button(action: {
                   // Perform registration action here
                   buy = true
               }) {
                   Text("Aceptar")
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
                       SuccessPan(passedString: "Tu Afiliación al Dscto por planilla esta en proceso")
                   }
               }
               .padding(.horizontal)
               
               Button(action: {
                   // Perform registration action here
                   gotoAsis = true
               }) {
                   Text("Cancelar")
                       .foregroundColor(.white)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(
                        .gray
                       )
                       .cornerRadius(10)
               }
               .fullScreenCover(isPresented: $gotoAsis) {
                   NavigationView{
                       Asistence()
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

struct Discount_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Discount()
        }
    }
}
