
import SwiftUI
import UIKit
 struct MainPage: View {
//    init() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = .blue
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//    }
     init() {
         UITabBarItem.appearance().badgeColor = .blue   // << here !!
     }
    let iconNames = [
        "shop",
        "assist",
        "gift",
        "start",
        "msg",
    ]
     
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
     @State private var personal = false
     @State private var share = false
     
     @State private var next=false;
     
     @State private var showMain = 0
     @State private var showStore = false
     @State private var showAssist = false
     @State private var showPrize = false
     @State private var showBenefit = false
     @State private var showConfiguration = false
     
     @State private var cartItemCount = 1
     
     @State private var showWhat: [[Bool]] = [[false, false, false],[false, false, false]]
     
     
     @State private var mwidth:CGFloat=10;
     
     @State private var isDropdownOpen = false
     
     @State private var isMenuOpen = false
     @State private var selectedOption = "Enterate"
     let options = ["Noticias y Actualidad", "Vivir Saludables", "Familia Unida", "Liderazgo Personal", "Cultura y Deporte"]
     
     
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showMainPage = false
    
     @ViewBuilder
     func getViewForColumnAndRow(column: Int, row: Int) -> some View {
         if column == 0 && row == 0 {
             StoreView()
         }
         else if column==1&&row==0{
             Asistence()
         }
         else if column==0&&row==1{
             Prize()
         }
         else if column==1&&row==1{
             OtherCard()
         }
        
         else {
             		
         }
     }
     @StateObject private var articlesViewModel = ArticlesViewModel()
     @StateObject private var campaignsViewModel = CampaignsViewModel()
     
    var body: some View {
            GeometryReader { geometry in
                VStack{
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
                                                withAnimation{
                                                    showMenu = false;
                                                    showMain=0;
                                                }
                                            }) {
                                                HStack(){
                                                    Text("Inicio")
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 10)
                                                .frame(maxWidth: geometry.size.width/1.6 )
                                                //      .background(.green)
                                            }
                                            //                                        .fullScreenCover(isPresented: $showMain) {
                                            ////                                            NavigationView{
                                            ////                                                //                                                MainPage()
                                            ////                                            }
                                            //                                        }
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
                                                .frame(maxWidth: geometry.size.width/1.6 )
                                                //      .background(.green)
                                            }
                                            .fullScreenCover(isPresented: $showStore) {
                                                NavigationView{
                                                    StoreView()
                                                }
                                            }
                                            .padding(.horizontal,20)
                                            .background(Color("mColor"))
                                            
                                            Button(action: {
                                                // Your action for
                                                showAssist=true;
                                            }) {
                                                HStack{
                                                    Text("Asistencias y Seguros")
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 10)
                                                .frame(maxWidth: geometry.size.width/1.6 )
                                                //      .background(.green)
                                            }
                                            .fullScreenCover(isPresented: $showAssist) {
                                                NavigationView{
                                                    Asistence()
                                                }
                                            }
                                            .padding(.horizontal,20)
                                            .background(Color("mColor"))
                                            
                                            Button(action: {
                                                // Your action for
                                                showPrize=true;
                                            }) {
                                                HStack{
                                                    Text("Sorteos y Premios")
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 10)
                                                .frame(maxWidth: geometry.size.width/1.6 )
                                                //      .background(.green)
                                            }
                                            .fullScreenCover(isPresented: $showPrize) {
                                                NavigationView{
                                                    Prize()
                                                }
                                            }
                                            .padding(.horizontal,20)
                                            .background(Color("mColor"))
                                            
                                            Button(action: {
                                                // Your action for
                                                showBenefit=true;
                                            }) {
                                                HStack{
                                                    Text("Otros Beneficios")
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 10)
                                                .frame(maxWidth: geometry.size.width/1.6 )
                                                //      .background(.green)
                                            }
                                            .fullScreenCover(isPresented: $showBenefit) {
                                                NavigationView{
                                                    OtherCard()
                                                }
                                            }
                                            .padding(.horizontal,20)
                                            .background(Color("mColor"))
                                            
                                            Button(action: {
                                                // Your action for
                                                withAnimation{
                                                    
                                                    showMenu=false;
                                                    showMain=1;
                                                }
                                            }) {
                                                HStack{
                                                    Text("Cuenta")
                                                        .foregroundColor(.white)
                                                        .font(.title)
                                                    Spacer()
                                                }
                                                .padding(.bottom, 10)
                                                .frame(maxWidth: geometry.size.width/1.6 )
                                                //      .background(.green)
                                            }
                                            //                                        .fullScreenCover(isPresented: $showAccount) {
                                            //                                            NavigationView{
                                            //                                                //                                                MainPage()
                                            //                                            }
                                            //                                        }
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
                                            .frame(maxWidth: geometry.size.width/1.6 )
                                            
                                        }
                                        .padding(.horizontal,20)
                                        .background(Color("mColor"))
                                        
                                        if isMenuOpen {
                                            VStack(spacing:5) {
                                                ForEach(options, id: \.self) { option in
                                                    Button(action: {
                                                            personal=true;
                                                            selectedOption = option
//                                                            isMenuOpen.toggle()
//
//                                                            showMenu=false;
                                                       
                                                    }) {
                                                        HStack{
                                                            Text(option)
                                                                .foregroundColor(.white)
                                                                .font(.system(size:25))
                                                            
                                                        }
                                                        .padding(.vertical, 10)
                                                        .frame(maxWidth: geometry.size.width/1.6 )
                                                        //                                                                .background(.gray)
                                                    }
                                                    .fullScreenCover(isPresented: $personal){
                                                        NavigationView{
                                                            PersonalLeadership()
                                                        }
                                                    }
                                                    
                                                }
                                            }
                                            
                                            
                                        }

                                        
                                    }
                                    Spacer()
                                    Button(action: {
                                        // Your action here
                                        showConfiguration=true;
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
                                    .fullScreenCover(isPresented: $showConfiguration){
                                        NavigationView{
                                            Configuration()
                                        }
                                    }
                                }
                                .frame(width: geometry.size.width/1.2)
                                .background(Color("mColor"))
                                .transition(.move(edge: .leading))
                            }
                        }
                        ZStack(alignment: .top) {
                            Color(.white).edgesIgnoringSafeArea(.all)
//                            Button(action: {
//                                // Your action
//
//                                withAnimation {
//                                    self.showMenu.toggle();
//                                }
//
//                            }) {
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
                                        
                                        VStack {
                                            
                                            if(showMain==1){
                                                
                                                HStack{
                                                    VStack{
                                                        Spacer()
                                                        Image("inca")
                                                        
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height*0.5 : UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height*0.5 : UIScreen.main.bounds.width*0.5)
                                                            .clipShape(Circle())
                                                            .overlay(
                                                                HStack{
                                                                    Spacer()
                                                                    VStack{
                                                                        Spacer()
                                                                        Button(action:{}){
                                                                            Image(systemName: "camera")
                                                                                .font(.system(size: 24))
                                                                                .foregroundColor(.white)
                                                                                .padding(8)
                                                                                .background(Color.blue)
                                                                                .clipShape(Circle())
                                                                            // .offset(x: 80, y: 80)
                                                                        }
                                                                    }
                                                                }
                                                            )
                                                        
                                                        Spacer()
                                                        Text("Sildia Verónica")
                                                            .font(.title)
                                                        Text("Santiago Palomino")
                                                            .font(.title)
                                                        
                                                        Text("DNI: 70341705")
                                                            .font(.title)
                                                        
                                                        Spacer()
                                                        Image(uiImage: UIImage(data: generateQR(text: " Palomino DNI 70341705")!)!)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height*0.5 : UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height*0.5 : UIScreen.main.bounds.width*0.5)
                                                            .shadow(color:.clear, radius: 0, x: 0, y: 0)
                                                        Spacer()
                                                    }
                                                    .frame(maxWidth:.infinity)
                                                    .frame(maxHeight:.infinity)
                                                    .background(.white)
                                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                                    .cornerRadius(10)
                                                    .shadow(color: Color.gray.opacity(0.8), radius: 10, x: 0, y: 2)
                                                    
                                                    
                                                }
                                                .padding()
                                            }
                                            else if(showMain==2){
                                                ScrollView{
                                                    ZStack{
                                                        Button(action: {
                                                            // Action when the button is tapped
                                                        }) {
                                                            Text("Bienvenido a tu APP de Beneficios")
                                                                .foregroundColor(.white)
                                                                .padding(10)
                                                                .background(Color.blue)
                                                                .cornerRadius(50)
                                                        }
                                                        .padding(.top,UIScreen.main.bounds.height/8)
                                                        .zIndex(1)
                                                        
                                                        if let firstCampaign = campaignsViewModel.campaigns.first {
                                                            AsyncImage(url:URL(string:firstCampaign.coverImageUrl)){ phase in
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
                                                        }
                                                        
                                                        Image("cap_free")
                                                            .resizable()
                                                            .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 4)
                                                        //                                                    .clipped()
                                                            .zIndex(0)
                                                        
                                                    }
                                                    .onAppear {
                                                        campaignsViewModel.fetchCampaigns()
                                                    }
                                                    HStack{
                                                        Text("Liderazo Personal")
                                                        Spacer()
                                                        
                                                        Image("heart_blue")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                                                            .padding(.horizontal)
                                                        Button(action:{
                                                            share=true;
                                                        }){
                                                            Image("share_blue")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                                                        }
                                                    }
                                                    .padding()
                                                    Text("Cómo fortalecer tu autoestima en los momento más dificiles")
                                                    
                                                    Button(action: {
                                                        // Action when the button is tapped
                                                        withAnimation{
                                                            next=true;
                                                        }
                                                    }) {
                                                        Image("cap_woman")
                                                            .resizable()
                                                            .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 4)
                                                            .aspectRatio(contentMode: .fill)
                                                    }
                                                    .fullScreenCover(isPresented: $next) {
                                                        NavigationView{
                                                            PersonalLeadership()
                                                        }
                                                    }
                                                    HStack{
                                                        Text("Liderazo Personal")
                                                        Spacer()
                                                        
                                                        Image("heart_blue")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                                                            .padding(.horizontal)
                                                        
                                                        Button(action:{
                                                            withAnimation{
                                                                share=true;
                                                            }
                                                        }){
                                                            Image("share_blue")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                                                        }
                                                    }
                                                    .padding()
                                                    Text("Lorem ipsum dolor sit amet redo neue lt std")
                                                    Button(action: {
                                                        // Action when the button is tapped
                                                    }) {
                                                        Image("family")
                                                            .resizable()
                                                            .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 4)
                                                            .aspectRatio(contentMode: .fill)
                                                    }
                                                }
                                                .onAppear {
                                                    articlesViewModel.fetchArticles(categoryId: 2)
                                                }
                                            }
                                            else  {
                                                Spacer()
                                                LazyVGrid(columns: [GridItem(.flexible(), spacing: -80), GridItem(.flexible(), spacing:20)], spacing: 40) {
                                                    ForEach(0..<3) { row in
                                                        ForEach(0..<2) { column in
                                                            if !(row == 2 && column == 1) {
                                                                Button(action: {
                                                                    
                                                                    if column==0&&row==2{
                                                                        withAnimation{
                                                                            self.showMain=2
                                                                        }
                                                                        
                                                                    }
                                                                    else{
                                                                        showWhat[column][row]=true;
                                                                    }
                                                                    
                                                                }) {
                                                                    
                                                                    VStack {
                                                                        Image(iconNames[row * 2 + column])
                                                                            .font(.system(size: mwidth/20))
//                                                                            .padding(.horizontal, 30)
//                                                                            .padding(.vertical, 30)
//                                                                            .background(Color.blue.opacity(0.8))
//                                                                            .overlay(Color.blue.opacity(0.6))
                                                                            
                                                                        Text(names[row * 2 + column])
                                                                            .font(.system(size: 18))
                                                                            .multilineTextAlignment(.center)
                                                                    }
                                                                }
                                                                .fullScreenCover(isPresented: $showWhat[column][row]) {
                                                                    NavigationView{
                                                                        getViewForColumnAndRow(column: column, row: row)
                                                                        
                                                                    }
                                                                }
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                                Spacer()
                                            }
                                        }
                                        
                                        //                                .padding(.top, 30)
                                        Spacer()
                                        TabView {
                                            // First tab
                                            Text("")
                                                .tabItem {
                                                    //                                            Label("", systemImage: "ellipsis")
                                                    //                                                .accessibilityHidden(true)
                                                    Button(action: {
                                                        // Handle cart button action
                                                    }) {
                                                        Image(systemName: "ellipsis")
                                                            .accessibilityHidden(true)
                                                        
                                                    }
                                                    //                                     .badge(3) // Add a count number
                                                }
                                            
                                            // Second tab
                                            Text("")
                                                .tabItem {
                                                    //                                            Label("", systemImage: "heart")
                                                    //                                                .accessibilityHidden(true)
                                                    Button(action: {
                                                        // Handle cart button action
                                                    }) {
                                                        Image(systemName: "heart")
                                                            .accessibilityHidden(true)
                                                        
                                                    }
                                                    //                                     .badge(2) // Add a count number
                                                }
                                            // Third tab
                                            Text("")
                                                .tabItem {
                                                    //                                            Label("", systemImage: "magnifyingglass")
                                                    //                                                .accessibilityHidden(true)
                                                    Button(action: {
                                                        // Handle cart button action
                                                    }) {
                                                        Image(systemName: "magnifyingglass")
                                                            .accessibilityHidden(true)
                                                        
                                                    }
                                                    //                                     .badge(1) // Add a count number
                                                }
                                            Text("")
                                                .tabItem {
                                                    //                                            Label("", systemImage: "cart")
                                                    //                                                .accessibilityHidden(true)
                                                    //                                                .badge(1) // Add a count number
                                                    HStack{
                                                        Button(action: {
                                                            // Handle cart button action
                                                        }) {
                                                            Image(systemName: "cart")
                                                            //                                                        .accessibilityHidden(true)
                                                            
                                                        }
                                                    }
                                                }
                                                .badge(1)
                                                .foregroundColor(.blue)
                                            
                                        }
                                        .frame(maxHeight:geometry.size.height/12)
                                        .shadow(color: Color.gray.opacity(0.8), radius: 5, x: 0, y: 2)
                                        
                                        
                                        
                                        
                                    }
                                }
//                            }
                        }
                        .overlay(Color.black.opacity(showMenu ? 0.6:0))
                    }
                    .onAppear {
                        mwidth=UIScreen.main.bounds.width
                    }
                    .overlay(Color.black.opacity(share ? 0.6:0))
                    if share {
                        //                                     RoundedRectangle(cornerRadius: 20)
                        //                                         .fill(.thickMaterial)
                        //                                         .frame(width: 350, height: 120)
                        //                                         .transition(.scale)
                        VStack{
                            HStack{
                                Button(action:{
                                    withAnimation {
                                        share.toggle()
                                    }
                                }){
                                    Image(systemName: "multiply")
                                }
                                .padding()
                                Spacer()
                            }
                            Text("Compartir")
                                .font(.system(size:UIScreen.main.bounds.width/17))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            HStack{
                                Spacer()
                                VStack{
                                    Button(action:{}){
                                        Image("facebook")
                                    }
                                    Text("Facebook")
                                }
                                Spacer()
                                VStack{
                                    Button(action:{}){
                                        Image("twitter")
                                    }
                                    Text("Twitter")
                                }
                                Spacer()
                                VStack{
                                    Button(action:{}){
                                        Image("stories")
                                    }
                                    Text("Stories")
                                }
                                Spacer()
                                VStack{
                                    Button(action:{}){
                                        Image("whatsapp")
                                    }
                                    Text("Whatsapp")
                                }
                                Spacer()
                            }
                            
                            Button(action:{
                                withAnimation {
                                    share.toggle()
                                }
                            }){
                                Text("Cancelar")
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        .gray
                                    )
                                    .cornerRadius(10)
                                    .padding(.horizontal)
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
struct CustomTabItemView: View {
    var title: String
    var badgeText: String? // Optional badge text
    
    var body: some View {
        VStack {
            Image(systemName: "your-tab-icon")
            Text(title)
            
            if let badgeText = badgeText {
                Text(badgeText)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 10, y: -10)
            }
        }
    }
}
 struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainPage()
        }
    }
}
