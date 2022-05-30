//
//  Applicon.swift
//  Stocks
//
//  Created by Ульяна Гритчина on 14.05.2022.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}
