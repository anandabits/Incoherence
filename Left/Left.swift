//
//  IntConform.swift
//  Left
//
//  Created by Matthew Johnson on 4/2/18.
//  Copyright © 2018 Anandabits LLC. All rights reserved.
//

import Foundation
import Base

extension WrappedInt: Comparable {
    public static func < (lhs: WrappedInt, rhs: WrappedInt) -> Bool {
        return lhs.value < rhs.value
    }

    public static func == (lhs: WrappedInt, rhs: WrappedInt) -> Bool {
        return lhs.value == rhs.value
    }
}

public func makeSortedArray(_ values: [WrappedInt]) -> SortedArray<WrappedInt> {
    return SortedArray(values)
}
