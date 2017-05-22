import Vapor
import LoggerAPI

public final class Provider: Vapor.Provider {
    
    public static let repositoryName: String = "kitura-provider"
    
    public init() {}

    public convenience init(config: Config) throws {
        self.init()
    }
    
    public func boot(_ config: Config) throws {
        config.addConfigurable(server: KituraServer.self, name: "kitura")
    }

    public func boot(_ drop: Droplet) {
        Log.logger = KituraLogger(log: drop.log)
    }

    public func beforeRun(_ droplet: Droplet) throws {}
}
