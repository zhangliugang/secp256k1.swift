import XCTest
@testable import secp256k1

final class secp256k1Tests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }

    func test1() {
        let ctx = secp256k1_context_create(UInt32(SECP256K1_CONTEXT_VERIFY))!
        defer { secp256k1_context_destroy(ctx) }

        let pub = UnsafeMutablePointer<secp256k1_pubkey>.allocate(capacity: 1)
        defer { pub.deallocate() }

        let a = Data()
        let b = Data()

        a.withUnsafeBytes { (input: UnsafeRawBufferPointer) in
            b.withUnsafeBytes { (input2: UnsafeRawBufferPointer) in
                secp256k1_xonly_pubkey_tweak_add(
                    ctx,
                    pub,
                    input.bindMemory(to: secp256k1_xonly_pubkey.self).baseAddress.unsafelyUnwrapped,
                    input2.bindMemory(to: UInt8.self).baseAddress.unsafelyUnwrapped
                )
            }
        }
    }
}
