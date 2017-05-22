import KituraNet
import HTTP
import Foundation

extension ServerResponse {
    public func send(_ engine: EngineResponse) throws {
        statusCode = engine.status.makeKitura()

        for (key, val) in engine.headers {
            headers.append(key.key, value: [val])
        }

        switch engine.body {
        case .chunked(let closure):
            headers.append("Transfer-Encoding", value: ["Chunked"])
            let stream = KituraResponseStream(response: self)
            let chunker = ChunkStream(stream)
            try closure(chunker)
        case .data(let bytes):
            headers.append("Content-Length", value: [bytes.count.description])
            let data = Data(bytes: bytes)
            try write(from: data)
        }

        try end()

    }
}

extension Status {
    public func makeKitura() -> HTTPStatusCode {
        return HTTPStatusCode(rawValue: statusCode) ?? .internalServerError
    }
}
