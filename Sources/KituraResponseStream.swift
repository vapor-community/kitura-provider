import KituraNet
import Transport
import Core
import Foundation

public final class KituraResponseStream: Transport.Stream {
    public let response: KituraNet.ServerResponse

    public init(response: KituraNet.ServerResponse) {
        self.response = response
    }

    public func setTimeout(_ timeout: Double) throws {

    }

    public var closed: Bool = false

    public func close() throws {

    }

    public func send(_ bytes: Bytes) throws {
        try response.write(from: Data(bytes: bytes))
    }

    public func flush() throws {

    }

    public func receive(max: Int) throws -> Bytes {
        return []
    }

    public var peerAddress: String {
        return ""
    }
}
