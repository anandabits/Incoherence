//
//  UserTests.swift
//  UserTests
//
//  Created by Matthew Johnson on 4/2/18.
//  Copyright © 2018 Anandabits LLC. All rights reserved.
//

import XCTest
@testable import User

class UserTests: XCTestCase {
    func testExample() {
        let (left, right) = makeSortedArraysUsingBoth(2, 4, 1, 5, 3)
        XCTAssertEqual(left.value, [1, 2, 3, 4, 5])
        XCTAssertEqual(right.value, [5, 4, 3, 2, 1])
        
        XCTAssertTrue(left.isValid)
        XCTAssertEqual(left.value, left.resortedValue)

        // This fails because Swift chooses the "left" conformance when isValid is evaluated.
        // Note: Swift does not choose the conformance that was used when the value was initialized.
        XCTAssertTrue(right.isValid)

        // This fails because Swift chooses the "left" conformance when resortedValue is evaluated.
        // Note: Swift does not choose the conformance that was used when the value was initialized.
        XCTAssertEqual(right.value, right.resortedValue)

        // The merge algorithm works as expected here because both input values have been sorted with the same
        // conformance that is used when the merge algorithm is invoked.
        XCTAssertEqual(left.merge(with: left).value, [1, 1, 2, 2, 3, 3, 4, 4, 5, 5])

        // This fails because Swift chooses the "left" conformance when merge algorithm is invoked.
        // Note: Swift does not choose the conformance that was used when the values were initialized.
        XCTAssertEqual(right.merge(with: right).value, [5, 5, 4, 4, 3, 3, 2, 2, 1, 1])

        // As expected, attempting to merge values created with conformances that produce different
        // orderings produces an invalid result - the algorithm assumes both inputs have already
        // been sorted using the conformance of T: Comparable that is in scope when the merge is performed.
        XCTAssertFalse(left.merge(with: right).isValid)
        XCTAssertFalse(right.merge(with: left).isValid)
    }
}
