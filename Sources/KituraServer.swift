import HTTP
import Sockets
import KituraNet
import Vapor
import Foundation

public final class KituraServer: ServerProtocol {
    public let hostname: String
    public let port: Sockets.Port
    public let securityLayer: SecurityLayer
    public let server: KituraNet.HTTPServer

    // Kitura server holds weak pointer
    // to delegate. We must hold a strong one here.
    private var responderHandle: KituraResponder?

    public init(hostname: String, port: Sockets.Port, _ securityLayer: SecurityLayer) throws {
        self.hostname = hostname
        self.port = port
        self.securityLayer = securityLayer // TODO: TLS Support
        
        self.server = KituraNet.HTTP.createServer()
    }
    
    public func start(_ responder: Responder, errors: @escaping ServerErrorHandler) throws {
        let kituraResponder = KituraResponder(engine: responder)
        responderHandle = kituraResponder
        server.delegate = kituraResponder
        
        try server.listen(on: Int(port))
        
        ListenerGroup.waitForListeners()
    }
}
