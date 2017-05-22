import XCTest

@testable import VaporKitura

import Core
import HTTP
import Vapor
import LoggerAPI

class KituraServerTests: XCTestCase {

    static var allTests = [
        ("testServer", testServer)
    ]

    func testServer() throws {
        let port = 8095
        let server = try KituraServer(hostname: "localhost", port: UInt16(port), .none)
        let drop = try Droplet()

        Log.logger = KituraLogger(log: drop.log)

        class TestResponder: Responder {
            func respond(to request: Request) throws -> Response {
                return Response(status: .ok, headers: [
                    "Test": "From example"
                ], body: "Example Tested".bytes)
            }
        }

        let test = TestResponder()

        background {
            do {
                try server.start(test) { error in
                    XCTFail("Server error: \(error)")
                }

            } catch {
                XCTFail("Server failed to start: \(error)")
            }
        }

        drop.console.wait(seconds: 1)


        let response = try drop.client.get("http://127.0.0.1:\(port)")

        XCTAssertEqual(response.status, .ok)

        XCTAssertEqual(response.version.major, 1)
        XCTAssertEqual(response.version.minor, 1)
        XCTAssertEqual(response.version.patch, 0)

        XCTAssertEqual(response.keepAlive, true)

        XCTAssertEqual(response.cookies.cookies.count, 0)

        guard case .data(let bytes) = response.body else {
            XCTFail("Incorrect body type.")
            return
        }

        XCTAssertEqual(bytes.makeString(), "Example Tested")

        guard let testHeader = response.headers["test"] else {
            XCTFail("No 'Test' header.")
            return
        }

        XCTAssertEqual(testHeader, "From example")
    }

}
