//
//  SuccessPan.swift
//  CTE
//
//  Created by Leo Taylor on 7/26/23.
//

import SwiftUI

struct SuccessPan: View {
    
    var passedString: String
    init(passedString: String) {
           self.passedString = passedString
    }
    @State private var next=false;
    var body: some View {
        VStack(alignment:.center){
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size:UIScreen.main.bounds.width<UIScreen.main.bounds.height ? UIScreen.main.bounds.width/2 :  UIScreen.main.bounds.height/2))
                .foregroundColor(Color.blue)
//                .foregroundColor(
//                    LinearGradient(
//                        gradient: Gradient(colors: [.white, .blue, .blue]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                )
            Text(passedString)
                .font(.system(size:UIScreen.main.bounds.width<UIScreen.main.bounds.height ? UIScreen.main.bounds.width/12 :  UIScreen.main.bounds.height/12))
                .foregroundColor(.blue)
                .padding()
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
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
                    MainPage()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
    }
}

struct SuccessPan_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SuccessPan(passedString: "Tu Compra ha sido exitosa")
        }
    }
}
