import Vapor
import LoggerAPI

public final class Provider: Vapor.Provider {
    public init() {

    }

    public convenience init(config: Settings.Config) throws {
        self.init()
    }

    public func boot(_ drop: Droplet) {
        drop.addConfigurable(server: KituraServer.self, name: "kitura")
        Log.logger = KituraLogger(log: drop.log)
    }

    public func afterInit(_ drop: Droplet) {

    }

    public func beforeRun(_ drop: Droplet) {

    }
}
