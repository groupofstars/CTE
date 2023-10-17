//
//  PersonalLeadership.swift
//  CTE
//
//  Created by Leo Taylor on 7/29/23.
//

import SwiftUI

struct PersonalLeadership: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var share=false;
    
    var imageUrlString="https://bradleybernard.com/img/asset/YXNzZXRzL2dsb2JhbC9wcm9maWxlX3BpY19jaXJjbGUud2VicA==?s=c010931f7e4ce47a7ce5a5e267990abd"
    
    @StateObject private var articlesViewModel = ArticlesViewModel()
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                Text("Televisores")
                    .font(.title)
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                ScrollView{
                    
                    
                    
                    HStack{
                        Text("Liderazo Personal")
                        Spacer()
                        Button(action: {
                            // Action when the button is tapped
                            
                        }) {
                            Image("heart_blue")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                                .padding(.horizontal)
                        }
                        Button(action: {
                            // Action when the button is tapped
                            share=true;
                        }) {
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
                    }) {
//                        Image(uiImage: UIImage(data: NSData(base64Encoded: imageUrlString.data(using:.utf8)?? Data(), options:.init(rawValue: 0))))
//                                  .resizable()
//                                  .aspectRatio(contentMode:.fill)
//                                  .url(url: URL(string: imageUrlString))
//                        Image(imageUrlString)
//                            .resizable()
//                            .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 4)
//                            .aspectRatio(contentMode: .fill)
                        AsyncImage(url:URL(string:imageUrlString)){ phase in
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
                    
                    List(articlesViewModel.articles, id: \.id) { article in
                        HStack{
                            Text(article.title)
                            Spacer()
                            Button(action: {
                                // Action when the button is tapped
                            }) {
                                Image("heart_blue")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                                    .padding(.horizontal)
                            }
                            Button(action: {
                                // Action when the button is tapped
                                share=true;
                            }) {
                                Image("share_blue")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width / 20, height: UIScreen.main.bounds.width / 20)
                            }
                        }
                        .padding()
                        Text(article.content)
                        Button(action: {
                            // Action when the button is tapped
                        }) {
                            AsyncImage(url:URL(string:imageUrlString)){ phase in
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
                    }
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
        .onAppear {
            articlesViewModel.fetchArticles(categoryId: 1) // Provide the desired category ID
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.blue)
        })
        

    }
}

struct PersonalLeadership_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PersonalLeadership()
        }
    }
}
