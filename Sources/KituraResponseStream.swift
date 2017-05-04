import KituraNet
import Transport
import Core
import Foundation

public final class KituraResponseStream: Transport.WriteableStream {
    
    public let response: KituraNet.ServerResponse
    
    public var isClosed = false
    
    public init(response: KituraNet.ServerResponse) {
        self.response = response
        self.isClosed = false
    }
    
    public func setTimeout(_ timeout: Double) throws {}
    
    public func write(_ bytes: Bytes) throws {
        try response.write(from: Data(bytes: bytes))
    }
    
    public func flush() throws {}
    
    public func close() throws {}
}
