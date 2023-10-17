
import SwiftUI
import UIKit
struct StoreView: View {
//    init() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = .blue
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//    }
    
    let iconNames = [
        "cart.fill",
        "gift.fill",
        "message.fill",
        "shield",
        "star.fill",
    ]
    @State var selectedItem_grid=false
    @State var temp:String?
    let names = [
        "Tienda\n",
        "Asistencias\ny Seguros",
        "Sorteos\ny Premios",
        "Otros\nBeneficios",
        "Enterate",
    ]
    @State private var showMenu = false
    @State private var username = "Lin Li"
    @State private var email = "ABCDEFGHIJKLM@mail.com"
    @State private var mail = ""
    @State private var isPasswordVisible = false
    
    @State private var showMain = false
    @State private var showStore = false
    @State private var showAssist = false
    @State private var showPrize = false
    @State private var showBenefit = false
    @State private var showAccount = false
    
    
    @State private var mwidth:CGFloat=10;
    
    @State private var isDropdownOpen = false
    
    @State private var isMenuOpen = false
    @State private var selectedOption = "Enterate"
    let options = ["Noticias y Actualidad", "Vivir Saludables", "Familia Unida", "Liderazgo Personal", "Cultura y Deporte"]
    
    
//    @Binding var selectedTab: Int
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showMainPage = false
    
    
    
    @State private var selectedItem: Int = 0
    var gridItems: [[String]] {
        switch selectedItem {
        case 0:
            return [["TV1", "PC", "PC1"],
                    ["Phone", "Receivefgdsgfdgfdsgfdsgfdgfdg", "Speaker"],
                    ["Image7", "Image8", "ring"],
                    ["TV1", "PC", "PC1"],
                    ["Phone", "Receive", "Speaker"],
                    ["Image7", "Image8", "ring"],
                    ["TV1", "PC", "PC1"],
                    ["Phone", "Receive", "Speaker"],
                    ["Image7", "Image8", "ring"]
            ]
        case 1:
            return [["Image10", "Image11", "Image12"],
                    ["Image13", "Image14", "Image15"],
                    ["Image16", "Image17", "Image18"]]
        case 2:
            return [["Image19", "Image20", "Image21"],
                    ["Image22", "Image23", "Image24"],
                    ["Image25", "Image26", "Image27"]]
        default:
            return []
        }
    }
    
    
    
    var body: some View {
        GeometryReader { geometry in
            
            HStack(spacing:0) {
                if self.showMenu {
                    ZStack {
                        Rectangle()
                            .fill(Color.white.opacity(0.5))
                        VStack {
                            VStack(alignment: .leading,spacing:5) {
                                Text(self.username)
                                    .font(.system(size: 32))
                                    .padding()
                                    .foregroundColor(.green)
                                Text(self.email)
                                    .font(.system(size: 22))
                                    .padding()
                                    .foregroundColor(.brown)
                                
                            }
                            .foregroundColor(.gray)
                            
                            VStack(alignment: .leading,spacing: 20){
                                
                                if !isMenuOpen {
                                    Button(action: {
                                        showMain = true;
                                    }) {
                                        HStack{
                                            Text("Inicio")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            Spacer()
                                        }
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 250)
                                        //      .background(.green)
                                    }
                                    .fullScreenCover(isPresented: $showMain) {
                                        NavigationView{
                                            MainPage()
                                        }
                                    }
                                    .padding(.horizontal,20)
                                    .background(Color("mColor"))
                                    //                                    .opacity(0.5)
                                    
                                    Button(action: {
                                        showStore = true;
                                        
                                    }) {
                                        HStack{
                                            Text("Tienda")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            Spacer()
                                        }
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 250)
                                        //      .background(.green)
                                    }
                                    .fullScreenCover(isPresented: $showStore) {
                                        //NavigationView{
                                            StoreView()
                                        //}
                                    }
                                    .padding(.horizontal,20)
                                    .background(Color("mColor"))
                                    
                                    Button(action: {
                                        // Your action for "Inicio" button here
                                    }) {
                                        HStack{
                                            Text("Asistencias y Seguros")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            Spacer()
                                        }
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 250)
                                        //      .background(.green)
                                    }
                                    .padding(.horizontal,20)
                                    .background(Color("mColor"))
                                    
                                    Button(action: {
                                        // Your action for "Inicio" button here
                                    }) {
                                        HStack{
                                            Text("Sorteos y Premios")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            Spacer()
                                        }
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 250)
                                        //      .background(.green)
                                    }
                                    .padding(.horizontal,20)
                                    .background(Color("mColor"))
                                    
                                    Button(action: {
                                        // Your action for "Inicio" button here
                                    }) {
                                        HStack{
                                            Text("Otros Beneficios")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            Spacer()
                                        }
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 250)
                                        //      .background(.green)
                                    }
                                    .padding(.horizontal,20)
                                    .background(Color("mColor"))
                                    
                                    Button(action: {
                                        // Your action for "Inicio" button here
                                    }) {
                                        HStack{
                                            Text("Cuenta")
                                                .foregroundColor(.white)
                                                .font(.title)
                                            Spacer()
                                        }
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 250)
                                        //      .background(.green)
                                    }
                                    .padding(.horizontal,20)
                                    .background(Color("mColor"))
                                }
                                Button(action: {
                                    isMenuOpen.toggle()
                                }) {
                                    HStack {
                                        Text(selectedOption)
                                            .foregroundColor(.white)
                                            .font(.title)
                                        Spacer()
                                        Image(systemName: isMenuOpen ? "chevron.up" : "chevron.down")
                                            .foregroundColor(.white)
                                            .font(.title)
                                        Spacer()
                                    }
                                    .padding(.bottom, 10)
                                    .frame(maxWidth: 250)
                                    
                                }
                                .padding(.horizontal,20)
                                .background(Color("mColor"))
                                
                                if isMenuOpen {
                                    VStack(spacing:5) {
                                        ForEach(options, id: \.self) { option in
                                            Button(action: {
                                                selectedOption = option
                                                isMenuOpen.toggle()
                                            }) {
                                                HStack{
                                                    Text(option)
                                                        .foregroundColor(.white)
                                                        .font(.system(size:25))
                                                    
                                                }
                                                .padding(.vertical, 10)
                                                .frame(maxWidth: 250)
                                                //                                                                .background(.gray)
                                            }
                                            
                                        }
                                    }
                                    
                                    
                                }
                                
                            }
                            Spacer()
                            Button(action: {
                                // Your action here
                            }) {
                                HStack {
                                    Image(systemName: "gear")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 25))
                                    Text("Configuracion")
                                        .foregroundColor(.gray).font(.system(size:23))
                                }
                            }
                            .padding(.bottom, 30)
                        }
                        .frame(width: geometry.size.width/1.2)
                        .background(Color("mColor"))
                        .transition(.move(edge: .leading))
                    }
                }
                ZStack(alignment: .top) {
                    Color(.white).edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack {
                            Button(action: {
                                // Your action
                                
                                withAnimation {
                                    self.showMenu.toggle()
                                }
                                
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.white)
                                    .scaleEffect(1.5)
                                    .padding(.bottom,5)
                                
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color.blue)
                        // Your view content
                        if !self.showMenu {
                            VStack{
                                ZStack{
                                    Button(action: {
                                        // Action when the button is tapped
                                    }) {
                                        Text("Descubre miles de productos")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color.blue)
                                            .cornerRadius(50)
                                    }
                                    .padding(.top,UIScreen.main.bounds.height/8)
                                    .zIndex(1)
                                    
                                    Image("logo1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: UIScreen.main.bounds.height / 5)                .clipped()
                                        .zIndex(0)

                                    
                                    
                                }
                                GeometryReader { geometry in
                                    VStack {
                                        HStack {
                                                                                    // your buttons here...
                                            Button(action: {
                                                self.selectedItem = 0
                                            }) {
                                                VStack {
                                                    Image("TV")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100, height: 100)
                                                    Text("Tecnología")
                                                       
                                                }
                                            }
                                            .opacity(selectedItem == 0 ? 1 : 0.5)
                                            
                                            Button(action: {
                                                self.selectedItem = 1
                                            }) {
                                                VStack {
                                                    Image("House")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100, height: 100)
                                                    Text("ElectroHogar")
                                                }
                                            }
                                            .opacity(selectedItem == 1 ? 1 : 0.5)
                                            Button(action: {
                                                self.selectedItem = 2
                                            }) {
                                                VStack {
                                                    Image("sofa")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100, height: 100)
                                                    Text("Hogar")
                                                }
                                            }
                                            .opacity(selectedItem == 2 ? 1 : 0.5)
                                        }
                        //                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        ScrollView {
                                            ForEach(gridItems.indices, id: \.self) { row in
                                                HStack {
                                                    ForEach(self.gridItems[row], id: \.self) { item in
                                                        
                                                      
                                                        Button(action: {
                                                            // Perform registration action here
                                                            selectedItem_grid = true;
//                                                            print(item)
                                                            temp=item;
                                                        }) {
                                                            VStack {
                                                                
                                                                Image(item)
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: geometry.size.width / 5, height: geometry.size.width / 5)
                                                                Text(String(item.prefix(8)))
                                                                    .truncationMode(.tail)
                                                            }
                                                            .padding()
                                                            .border(Color.gray, width: 2)
                                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .fullScreenCover(isPresented: $selectedItem_grid) {
                                                            NavigationView{
                                                                DetailedGood(passedString: item)
                                                            }
                                                        }
                                                        
                                                        
                                                    }
                                                }
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                            }
                                        }
//                                        Text("Selected item: \(selectedItem + 1)")
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                }
                            }
                        }
                    }
                }
                
            }
            .onAppear {
                mwidth=UIScreen.main.bounds.width
            }
        }
    }
}

 struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StoreView()
        }
    }
}
