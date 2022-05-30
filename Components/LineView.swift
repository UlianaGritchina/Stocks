//
//  LineView.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 14.05.2022.
//

import SwiftUI

struct LineView: View {
    let width = UIScreen.main.bounds.width
    var body: some View {
        Rectangle()
            .frame(width: width - 40, height: 1)
            .foregroundColor(.gray.opacity(0.4))
            .cornerRadius(1)
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
