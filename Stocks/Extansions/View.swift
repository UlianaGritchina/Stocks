//
//  View.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 14.05.2022.
//

import SwiftUI

extension View {
    func withCardFormatting() -> some View {
        self.modifier(CardModifier())
    }
}
