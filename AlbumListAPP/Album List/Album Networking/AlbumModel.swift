//
//  AlbumMode;l.swift
//  Starter Project
//
//  Created by MohamedNajeh on 31/03/2023.
//

import Foundation

// MARK: - ImageElement
struct ImageElement: Codable {
    let id: String?
    let urls: Urls?
    let links: ImageLinks?

    enum CodingKeys: String, CodingKey {
        case id
        case urls, links
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}



// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

typealias Image = [ImageElement]



