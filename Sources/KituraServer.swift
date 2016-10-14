import HTTP
import Transport
import KituraNet
import Foundation

public final class KituraServer: ServerProtocol {
    public let host: String
    public let port: Int
    public let securityLayer: SecurityLayer
    public let middleware: [Middleware]
    public let server: KituraNet.HTTPServer

    // Kitura server holds weak pointer
    // to delegate. We must hold a strong one here.
    private var responderHandle: KituraResponder?

    public init(
        host: String,
        port: Int,
        securityLayer: SecurityLayer,
        middleware: [Middleware]
    ) throws {
        self.host = host
        self.port = port
        self.securityLayer = securityLayer
        self.middleware = middleware

        self.server = KituraNet.HTTP.createServer()
    }

    public func start(responder: Responder, errors: @escaping ServerErrorHandler) throws {
        let kituraResponder = KituraResponder(engine: responder)
        responderHandle = kituraResponder
        server.delegate = kituraResponder

        server.listen(port: port) { error in
            errors(.unknown(error))
        }

        ListenerGroup.waitForListeners()
    }
}
