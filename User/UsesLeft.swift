//
//  UsesLeft.swift
//  User
//
//  Created by Matthew Johnson on 4/2/18.
//  Copyright © 2018 Anandabits LLC. All rights reserved.
//

import Base
import Left

// Only Left is imported here, Swift appears to reliably choose the expected conformance.
func makeSortedArrayUsingLeft(_ ints: [WrappedInt]) -> SortedArray<WrappedInt> {
    return makeSortedArray(ints)
}
