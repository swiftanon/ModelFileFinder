// MockFileManager.swift
// Created by swiftanon on 8/27/24.

import Foundation
import ModelFileFinder

class MockFileManager: FileManagerProtocol {
    var mockContents: [URL] = []

    func contentsOfDirectory(
        at _: URL,
        includingPropertiesForKeys _: [URLResourceKey]?,
        options _: FileManager.DirectoryEnumerationOptions
    ) throws -> [URL] {
        mockContents
    }
}
