
import func Foundation.NSTemporaryDirectory
import class Foundation.FileManager
import class Foundation.JSONDecoder

enum Loader {
	static func load<T: PackageConfig>() throws -> T {
		let packageConfigJSON = NSTemporaryDirectory() + T.fileName

		guard let data = FileManager.default.contents(atPath: packageConfigJSON) else {
			throw Error("Could not find a file at \(packageConfigJSON) - something went wrong with compilation step probably")
		}

		return try JSONDecoder().decode(T.self, from: data)
	}
}
