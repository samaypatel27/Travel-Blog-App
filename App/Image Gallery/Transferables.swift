import SwiftUI

struct PhotoFile: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .image, shouldAttemptToOpenInPlace: true) { data in
            SentTransferredFile(data.url, allowAccessingOriginalFile: true)
        } importing: { received in
            guard let documentDirectory = FileManager.default.documentDirectory else {
                throw URLError(.fileDoesNotExist)
            }
            let fileName = received.file.lastPathComponent
            let destinationURL = documentDirectory.appendingPathComponent(fileName)
            try FileManager.default.copyItem(at: received.file, to: destinationURL)
            return Self.init(url: destinationURL)
        }
    }
}

