//
//  Protocol.swift
//  Base
//
//  Created by Matthew Johnson on 4/2/18.
//  Copyright © 2018 Anandabits LLC. All rights reserved.
//

import Foundation

// A simple wrapper around an Int that allows us to provide Comparable conformances in different modules.
public struct WrappedInt {
    public var value: Int

    public init(value: Int) {
        self.value = value
    }
}

extension WrappedInt: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.value = value
    }
}

public struct SortedArray<T: Comparable> {
    public let value: [T]

    // This value should always be identical to `value` but that is not always the case.
    // It is possible for this method to be called in a context where the conformance
    // used is _different_ than the conformance that was used when the value was initialized.
    public var resortedValue: [T] {
        return value.sorted()
    }

    // This value should always return `true` but it does not.
    // It is possible for this method to be accessed in a context where the conformance
    // used is _different_ than the conformance that was used when the value was initialized.
    public var isValid: Bool {
        return value == resortedValue
    }

    // The primary initializer which sorts the array that is provided.
    public init(_ array: [T]) {
        value = array.sorted()
    }

    // A private init only present for use by the merge algorithm below.
    private init(sorted array: [T]) {
        value = array
    }

    // This algorithm makes the assumption that both `self` and `other` have been
    // sorted *using (observably) identical conformances of T: Comparable*.
    // Unfortunately, Swift *does not* guarantee that to be the case.
    // T can be made to conform by two separate modules and those conformances
    // need not be compatible.
    // Worse, there is no way to know whether `self` and `other` were created
    // with the same conformance or not.
    // Because there is no way to know what conformance of T: Comparable
    // was used when `self` and `other` were created there are no valid
    // assumptions that can be made about the order of their elements.
    public func merge(with other: SortedArray<T>) -> SortedArray<T> {
        var result = [T]()
        result.reserveCapacity(value.count + other.value.count)

        var index = value.startIndex
        var otherIndex = other.value.startIndex

        while true {
            guard index < value.endIndex else {
                while otherIndex < other.value.endIndex {
                    result.append(other.value[otherIndex])
                    other.value.formIndex(after: &otherIndex)
                }
                return SortedArray(sorted: result)
            }
            guard otherIndex < other.value.endIndex else {
                while index < value.endIndex {
                    result.append(value[index])
                    value.formIndex(after: &index)
                }
                return SortedArray(sorted: result)
            }
            if value[index] < other.value[otherIndex] {
                result.append(value[index])
                value.formIndex(after: &index)
            } else {
                result.append(other.value[otherIndex])
                other.value.formIndex(after: &otherIndex)
            }
        }
    }
}
