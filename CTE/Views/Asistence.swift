
import SwiftUI
struct ButtonView: View {
    let buttonIndex: Int

    var body: some View {
        Text("Button \(buttonIndex + 1) View")
    }
}
 struct Asistence: View {
    @State private var selectedItem = false
     
     @State private var selectTab=true
     @State private var buy=false
     @State private var next=false
//     var passedString: String
//     init(passedString: String) {
//            self.passedString = passedString
     @State private var selectedButtonIndex = true;
//     }
     @State private var isButton1Selected = false
     @State private var isButton2Selected = false
     
     
     @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
         ZStack{
             GeometryReader { geometry in
                 VStack (){
                     ScrollView {
                         Text("Asistencias y Seguros")
                             .font(.title)
                             .padding(.horizontal)
                             .foregroundColor(.blue)
                         
                         
                         Image("cap_image_insur")
                             .frame(width:UIScreen.main.bounds.width/1.2 , height:UIScreen.main.bounds.width/2.2)
                         
                         Text("Te ofrecemos descuentos y asistencias pensados en tu bienestar y el de tu familia.")
                             .padding()
                             .padding()
                             .multilineTextAlignment(.center)
                         HStack{
                             Button(action: {
                                 // Perform registration action here
                                 withAnimation{
                                     buy.toggle()
                                 }
                                 
                             }) {
                                 Text("Quiero este plan \ns/10 mes")
                                     .foregroundColor(.white)
                                     .padding()
                                     .padding()
                                     .frame(maxWidth: .infinity)
                                     .background(Color.blue)
                                     .cornerRadius(10)
                             }
                             
                             .padding(.horizontal)
                             .padding(.bottom, 30)
                             
                             Button(action: {
                                 // Perform registration action here
                                 buy = true
                             }) {
                                 Text("Quiero este plan\ns/90 anual")
                                     .foregroundColor(.white)
                                     .padding()
                                     .padding()
                                     .frame(maxWidth: .infinity)
                                     .background(Color.blue)
                                     .cornerRadius(10)
                             }
                             //                        .fullScreenCover(isPresented: $buy) {
                             //                            NavigationView{
                             //                                DeliveryType()
                             //                            }
                             //                        }
                             .padding(.horizontal)
                             .padding(.bottom, 30)
                         }
                         
                     }
                     .padding()
                     .overlay(Color.black.opacity(buy ? 0.6:0))
                     
                     if buy {
        //                                     RoundedRectangle(cornerRadius: 20)
        //                                         .fill(.thickMaterial)
        //                                         .frame(width: 350, height: 120)
        //                                         .transition(.scale)
                         VStack{
                             HStack{
                                 Button(action:{
                                     withAnimation {
                                         buy.toggle()
                                     }
                                 }){
                                     Image(systemName: "multiply")
                                 }
                                 .padding()
                                 Spacer()
                             }
                             Text("Plan Asistencias y Seguros")
                                 .font(.system(size:UIScreen.main.bounds.width/15))
                                 .fontWeight(.bold)
                                 .foregroundColor(.blue)
                             
                          
                             
                             Text("Selecciona la forma de pago")
                                 .padding(.bottom)
                             Button(action:{
                                 selectedButtonIndex=true;
                             }){
                                 HStack{
                                     Image(systemName: selectedButtonIndex ? "largecircle.fill.circle" : "circle")
                                     Text("Pago por Descuento por Planilla")
                                         .font(.system(size:UIScreen.main.bounds.width / 30))
                                         .padding(.vertical,UIScreen.main.bounds.width/66)
                                 }
                             }
                             Button(action:{
                                 selectedButtonIndex=false;
                             }){
                                 HStack{
                                     Image(systemName: !selectedButtonIndex ? "largecircle.fill.circle" : "circle")
                                     Text("Pago con Tarjeta Débito/Crédito")
                                         .font(.system(size:UIScreen.main.bounds.width / 30))
                                         .padding(.vertical,UIScreen.main.bounds.width/66)
                                 }
                             }
                             Button(action: {
                                 // Perform registration action here
                                 next = true
                             }) {
                                 Text("Continuar")
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
                             .fullScreenCover(isPresented: $next) {
                                 NavigationView{
                                     if(selectedButtonIndex){
                                         PaymentMethod(passedString: "Tu Compra ha sido")
                                     }
                                     else{
                                         Discount()
                                     }
                                 }
                             }
                             .padding(.horizontal)
                             .padding()
                             
                         }
                         .background(.white)
                         .transition(.scale)
                         .cornerRadius(20)
                         
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
}


struct Asistence_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Asistence()
        }
    }
}
