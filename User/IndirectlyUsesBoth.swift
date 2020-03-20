//
//  IndirectlyUsesBoth.swift
//  User
//
//  Created by Matthew Johnson on 4/2/18.
//  Copyright © 2018 Anandabits LLC. All rights reserved.
//

import Base

func makeSortedArraysUsingBoth(_ ints: WrappedInt...) -> (SortedArray<WrappedInt>, SortedArray<WrappedInt>) {
    return (makeSortedArrayUsingLeft(ints), makeSortedArrayUsingRight(ints))
}
