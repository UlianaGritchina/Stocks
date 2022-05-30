//
//  CardView.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 25.05.2022.
//

import SwiftUI

struct CardView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: width - 80, height: height / 4)
            .withCardFormatting()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("Card"))
            .blur(radius: 0.5)
            .shadow(color: Color("Shadow"), radius: 5, x: 0, y: 5)
    }
}
