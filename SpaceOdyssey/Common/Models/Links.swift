//
//  Links.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

struct Links: Codable {
    let missionPatch, missionPatchSmall: String?
    let articleLink: String?
    let wikipedia, videoLink: String?
    let flickrImages: [String]?
    let presskit: String?
    let redditCampaign: String?
    let redditLaunch: String?
    let redditRecovery, redditMedia: String?
    
    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case articleLink = "article_link"
        case wikipedia
        case videoLink = "video_link"
        case flickrImages = "flickr_images"
        case presskit
        case redditCampaign = "reddit_campaign"
        case redditLaunch = "reddit_launch"
        case redditRecovery = "reddit_recovery"
        case redditMedia = "reddit_media"
    }
}

extension Links {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Links.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        missionPatch: String?? = nil,
        missionPatchSmall: String?? = nil,
        articleLink: String?? = nil,
        wikipedia: String?? = nil,
        videoLink: String?? = nil,
        flickrImages: [String]?? = nil,
        presskit: String?? = nil,
        redditCampaign: String?? = nil,
        redditLaunch: String?? = nil,
        redditRecovery: String?? = nil,
        redditMedia: String?? = nil
        ) -> Links {
        return Links(
            missionPatch: missionPatch ?? self.missionPatch,
            missionPatchSmall: missionPatchSmall ?? self.missionPatchSmall,
            articleLink: articleLink ?? self.articleLink,
            wikipedia: wikipedia ?? self.wikipedia,
            videoLink: videoLink ?? self.videoLink,
            flickrImages: flickrImages ?? self.flickrImages,
            presskit: presskit ?? self.presskit,
            redditCampaign: redditCampaign ?? self.redditCampaign,
            redditLaunch: redditLaunch ?? self.redditLaunch,
            redditRecovery: redditRecovery ?? self.redditRecovery,
            redditMedia: redditMedia ?? self.redditMedia
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    
    var youTubeVideoId: String? {
        guard let link = videoLink else { return nil }
        guard let url = URL(string: link) else { return nil }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        guard let host = components.host else { return nil }
        guard host.contains("youtube.com") else { return nil }
        return components.queryItems?.first(where: { $0.name == "v" })?.value
    }
}
