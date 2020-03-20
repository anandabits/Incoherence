//
//  UsesRight.swift
//  User
//
//  Created by Matthew Johnson on 4/2/18.
//  Copyright © 2018 Anandabits LLC. All rights reserved.
//

import Base
import Right

// Only Right is imported here, Swift appears to reliably choose the expected conformance.
func makeSortedArrayUsingRight(_ ints: [WrappedInt]) -> SortedArray<WrappedInt> {
    return makeSortedArray(ints)
}
