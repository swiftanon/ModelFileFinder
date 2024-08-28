// FileManagerProtocol.swift
// Created by swiftanon on 7/22/24

import Foundation

public protocol FileManagerProtocol {
  /// abstract functionality of fileManager.contentsOfDirectory
  func contentsOfDirectory(
    at url: URL,
    includingPropertiesForKeys keys: [URLResourceKey]?,
    options mask: FileManager.DirectoryEnumerationOptions
  ) throws -> [URL]
}

/// Extend FileManager to conform to Protocol
/// `Note:` by extending FileManager to conform to
/// FileManagerProtocol, you allow FileManager to be
/// used wherever FileManagerProtocol is expected:
extension FileManager: FileManagerProtocol {}
