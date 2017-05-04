import KituraNet
import HTTP
import URI

extension ServerRequest {
    public func makeEngine() throws -> EngineRequest {
        let uri = try URI(urlURL.absoluteString)

        let version = Version(
            major: Int(httpVersionMajor ?? 1),
            minor: Int(httpVersionMinor ?? 0),
            patch: 0
        )

        var engineHeaders: [HeaderKey: String] = [:]

        headers.forEach { (keyString, vals) in
            let key = HeaderKey(keyString)
            let val = vals.joined(separator: "\r\n\(keyString): ")
            engineHeaders[key] = val
        }

        let body: Body = .data(try readString()?.bytes ?? [])

        return EngineRequest(
            method: Method(method),
            uri: uri,
            version: version,
            headers: engineHeaders,
            body: body
        )
    }
}

