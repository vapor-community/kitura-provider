import KituraNet
import Transport
import Core
import Foundation

public final class KituraResponseStream: WriteableStream {
    
    public func write(max: Int, from buffer: Bytes) throws -> Int {
        try response.write(from: Data(bytes: buffer))
        return buffer.count
    }
    
    public let response: KituraNet.ServerResponse
    
    public var isClosed = false
    
    public init(response: KituraNet.ServerResponse) {
        self.response = response
        self.isClosed = false
    }
    
    public func setTimeout(_ timeout: Double) throws {}
    
    public func close() throws {
        isClosed = true
    }
}
