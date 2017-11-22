import Foundation

public final class AssertDiffHelper {

    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() throws {

        guard arguments.count == 2 else { throw Error.exactlyOneArgumentExpected(arguments) }
        guard let argument = arguments.last else { throw Error.exactlyOneArgumentExpected(arguments) }

        let components = argument.components(separatedBy: " is not equal to ")
        guard components.count == 2 else { throw Error.exactlyOneNotEqualExpected(argument) }

        let first = components[0]
        let second = components[1]

        let folder = Folder.temporary
        
        let file1 = try folder.createFile(named: "first.txt", contents: first)
        let file2 = try folder.createFile(named: "second.txt", contents: second)

        let task = Process()
        task.launchPath = "/usr/local/bin/ksdiff"
        task.arguments = [file1, file2].map { $0.path }
        task.launch()
        task.waitUntilExit()

        try? file1.delete()
        try? file2.delete()
    }

    enum Error: Swift.Error {
        case exactlyOneArgumentExpected([String])
        case exactlyOneNotEqualExpected(String)
    }

}
