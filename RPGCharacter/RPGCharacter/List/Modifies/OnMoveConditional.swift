//
//  OnMoveConditional.swift
//  RPGCharacter
//
//  Created by Caio de Almeida Pessoa on 09/07/24.
//

import SwiftUI

extension DynamicViewContent  {
    /// Conditionally applies the `.onMove` modifier to the `ForEach` view.
    ///
    /// This modifier allows you to conditionally enable or disable the move functionality for the items
    /// in the `ForEach` view. When enabled, it will call the provided action to handle the movement of items.
    ///
    /// - Parameters:
    ///   - disabled: A Boolean value that determines whether the move functionality is disabled.
    ///               If `true`, the `.onMove` modifier will be applied. If `false`, the `.onMove` modifier will not be applied.
    ///   - action: The action to perform when items are moved, specified as a closure. The closure takes two arguments:
    ///             the indices of the moved items and the new offset of the items. If `nil`, the `.onMove` modifier will not be applied.
    /// - Returns: A view that conditionally applies the `.onMove` modifier based on the value of the `disabled` parameter.
    func onMoveConditional(disabled: Bool, perform action: Optional<(IndexSet, Int) -> Void>) -> some View {
        Group {
            if(disabled) {
                self
            }else {
                self
                    .onMove(perform: action)
            }
        }
    }
}
