import HTTP
import Transport
import KituraNet
import Foundation

public final class KituraResponder: KituraNet.ServerDelegate {
    public let engineResponder: EngineResponder

    public init(engine: EngineResponder) {
        self.engineResponder = engine
    }

    public func handle(request: KituraNet.ServerRequest, response: KituraNet.ServerResponse) {
        do {
            let engineRequest = try request.makeEngine()
            let engineResponse = try engineResponder.respond(to: engineRequest)

            try response.send(engineResponse)
        } catch {
            print("[Kitura Server Error] \(error)")
        }
    }
}

