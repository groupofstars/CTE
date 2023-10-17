//
//  Prize.swift
//  CTE
//
//  Created by Leo Taylor on 7/27/23.
//

import SwiftUI

struct Prize: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var share:Bool=false
    
    @StateObject private var rafflesViewModel = RafflesViewModel()
    
    var body: some View {
        VStack{
            
            ScrollView {
                VStack(spacing: 10) {
                    Text("Sorteos y Premios")
                        .font(.title)
                        .padding(.horizontal)
                        .foregroundColor(.blue)
                    Text("¡Participa ahora!")
                        .font(.title2)
                        .padding(.horizontal)
                        .foregroundColor(.blue)
                    Text("Tenemos grandes premios y sorteos para ti, solo regístrate en los que desees, llena tus datos y ya estarás participando")
                        .padding(.horizontal)
                        .padding()
                        .multilineTextAlignment(.center)
                    ForEach(rafflesViewModel.raffles, id: \.id) { raffle in
                        GoodsCard(title: "los", price: 10.0, imageUrl: raffle.coverImageUrl,share:$share)
                            .padding(.bottom)
                            .padding(.horizontal)
                    }
                    GoodsCard(title: "los", price: 10.0, imageUrl: "product1",share:$share)
                        .padding(.bottom)
                        .padding(.horizontal)
                    GoodsCard(title: "p55", price: 20.0, imageUrl: "product2",share:$share)
                        .padding(.bottom)
                        .padding(.horizontal)
                    GoodsCard(title: "laptop", price: 30.0, imageUrl: "product3",share:$share)
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    // Add more cards here...
                }
                .onAppear {
                    rafflesViewModel.fetchRaffles()
                }
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
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
        
    }
}

struct Prize_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Prize()
        }
    }
}
struct GoodsCard: View {
    let title: String
    let price: Double
    let imageUrl: String
    @Binding var share:Bool
    @State var next:Bool=false

    var body: some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                Button(action:{share=true;}){
                    Image("share")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .padding(12)
                        .background(
//                            RadialGradient(
//                                gradient: Gradient(colors: [.blue,.blue, .white]),
//                                center: .center,
//                                startRadius: 0,
//                                endRadius: 25
//                            )
                            LinearGradient(
                                gradient: Gradient(colors: [.white,.blue, .blue, .blue]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                .padding()
            }
           
        }
        
        .background(
            Button(action:{next=true;})
            {
                if(title != ""){
                    Image(title)
                        .resizable()
                }
                AsyncImage(url:URL(string: imageUrl)){ phase in
                    if let image = phase.image {
                        image // Displays the loaded image.
                            .resizable()
                    } else if phase.error != nil {
                        Color.red // Indicates an error.
                    } else {
                        ProgressView()
                    }
                }
//                .frame(width: .infinity, height: .infinity)
            }
            .fullScreenCover(isPresented: $next) {
                NavigationView{
                    PrizeDetail(passedString: title)
                }
            }
           
        )
        .background(
            RoundedRectangle(cornerRadius: 5)
               .stroke(Color.gray, lineWidth: 0.5)
        )
        .frame(width: .infinity, height: 170)
        .cornerRadius(10)
    }
}
