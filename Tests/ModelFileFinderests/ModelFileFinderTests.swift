// ModelFileFinderTests.swift
// Created by swiftanon on 8/27/24.

@testable import ModelFileFinder
import os
import XCTest

final class ModelFileFinderTests: XCTestCase {
    var modelFileFinder: ModelFileFinder!
    var mockFileManager: MockFileManager!

    override func setUpWithError() throws {
        try super.setUpWithError()

        mockFileManager = makeMockDirectoryContents()
        modelFileFinder = ModelFileFinder(fileManager: mockFileManager)
    }

    override func tearDownWithError() throws {
        modelFileFinder = nil
        mockFileManager = nil
        try super.tearDownWithError()
    }

    private func makeMockDirectoryContents() -> MockFileManager {
        let mockFileManager = MockFileManager()

        mockFileManager.mockContents = [
            URL(fileURLWithPath: "/path/to/FirstModel.swift"),
            URL(fileURLWithPath: "/path/to/SecondModel.swift"),
            URL(fileURLWithPath: "/path/to/README.md"),
            URL(fileURLWithPath: "/path/to/Regular.swift"),
        ]

        return mockFileManager
    }

    private static let logger = Logger(
        subsystem: "io.swiftpackage.fileNameGenerator",
        category: "LibraryPackageTests"
    )

    func testGenerateList() throws {
        do {
            let result = try modelFileFinder.makeList()
            let expectedFiles = ["FirstModel", "SecondModel"]
            XCTAssertEqual(result.sorted(), expectedFiles, "generateList did not return expected files")
        } catch {
            Self.logger.error(
                "Test failed with error: \(error.localizedDescription, privacy: .public)"
            )
        }
    }
}
