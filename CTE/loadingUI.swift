//
//  loadingUI.swift
//  CTE
//
//  Created by Leo Taylor on 7/5/23.
//

import SwiftUI

struct loadingUI: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 361, height: 641)
          .background(
            Image("PATH_TO_IMAGE")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 361, height: 641)
              .clipped()
          )
    }
}

struct loadingUI_Previews: PreviewProvider {
    static var previews: some View {
        loadingUI()
    }
}
