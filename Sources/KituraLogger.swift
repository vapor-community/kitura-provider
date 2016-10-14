import LoggerAPI
import Vapor

public final class KituraLogger: LoggerAPI.Logger {
    let log: LogProtocol

    public init(log: LogProtocol) {
        self.log = log
    }

    public func log(_ type: LoggerMessageType, msg: String, functionName: String, lineNum: Int, fileName: String) {
        log.log(type.makeLogLevel(), message: "[Kitura] \(msg)", file: fileName, function: functionName, line: lineNum)
    }

    public func isLogging(_ level: LoggerMessageType) -> Bool {
        return true
    }
}

extension LoggerMessageType {
    public func makeLogLevel() -> LogLevel {
        switch self {
        case .debug:
            return .debug
        case .entry:
            return .custom("Entry")
        case .error:
            return .error
        case .exit:
            return .custom("Exit")
        case .info:
            return .info
        case .verbose:
            return .verbose
        case .warning:
            return .warning
        }
    }
}
