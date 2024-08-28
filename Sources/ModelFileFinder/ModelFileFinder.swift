// ModelFileFinder.swift
// Created by swiftanon on 7/22/24

import Foundation
import os

public struct ModelFileFinder {
  private let fileManager: FileManagerProtocol

  private let logger = Logger(
    subsystem: "io.swiftpackage.ListMaker",
    category: "LibraryPackage"
  )

  public init(fileManager: FileManagerProtocol = FileManager.default) {
    self.fileManager = fileManager
  }

  public func makeList() throws -> [String] {
    var fileNames = [String]()

    let currentFilePath = #file
    let currentFileURL = URL(filePath: currentFilePath, directoryHint: .inferFromPath)
    let sourceDirectoryURL = currentFileURL.deletingLastPathComponent()

    do {
      let contents = try fileManager.contentsOfDirectory(
        at: sourceDirectoryURL,
        includingPropertiesForKeys: nil,
        options: []
      )

      fileNames = contents.map(\.lastPathComponent)

    } catch {
      logger.error("Error occurred: \(error.localizedDescription)")
      throw error
    }

    let currentFileName = URL(
      filePath: currentFilePath,
      directoryHint: .inferFromPath
    ).lastPathComponent

    let intermediateResult = fileNames.filter { $0 != currentFileName }
    let filesBySuffix = filteredBySuffix(intermediateResult)
    return stripFileNamesOfSuffix(filesBySuffix)
  }

  private func filteredBySuffix(_ fileNamesList: [String]) -> [String] {
    fileNamesList.filter { str in
      str.hasSuffix("Model.swift")
    }
  }

  private func stripFileNamesOfSuffix(_ fileNamesList: [String]) -> [String] {
    fileNamesList.map { str in
      str.replacingOccurrences(of: ".swift", with: "", options: .regularExpression)
    }
  }
}
