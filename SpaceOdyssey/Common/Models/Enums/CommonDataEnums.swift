//
//  CommonDataEnums.swift
//  SpaceOdyssey
//
//  Created by Martin Lukacs on 19/09/2018.
//  Copyright © 2018 martin. All rights reserved.
//

import Foundation

enum SiteID: String, Codable {
    case ccafsSlc40 = "ccafs_slc_40"
    case kscLc39A = "ksc_lc_39a"
    case kwajaleinAtoll = "kwajalein_atoll"
    case vafbSlc4E = "vafb_slc_4e"
}

enum SiteName: String, Codable {
    case ccafsSlc40 = "CCAFS SLC 40"
    case kscLc39A = "KSC LC 39A"
    case kwajaleinAtoll = "Kwajalein Atoll"
    case vafbSlc4E = "VAFB SLC 4E"
}

enum SiteNameLong: String, Codable {
    case capeCanaveralAirForceStationSpaceLaunchComplex40 = "Cape Canaveral Air Force Station Space Launch Complex 40"
    case kennedySpaceCenterHistoricLaunchComplex39A = "Kennedy Space Center Historic Launch Complex 39A"
    case kwajaleinAtollOmelekIsland = "Kwajalein Atoll Omelek Island"
    case vandenbergAirForceBaseSpaceLaunchComplex4E = "Vandenberg Air Force Base Space Launch Complex 4E"
}

enum LandingType: String, Codable {
    case asds = "ASDS"
    case ocean = "Ocean"
    case rtls = "RTLS"
}

enum LandingVehicle: String, Codable {
    case jrti = "JRTI"
    case lz1 = "LZ-1"
    case lz2 = "LZ-2"
    case ocisly = "OCISLY"
}

enum RocketID: String, Codable {
    case falcon1
    case falcon9
    case falconheavy
}

enum RocketName: String, Codable {
    case falcon1 = "Falcon 1"
    case falcon9 = "Falcon 9"
    case falconHeavy = "Falcon Heavy"
}

enum RocketType: String, Codable {
    case ft = "FT"
    case merlinA = "Merlin A"
    case merlinC = "Merlin C"
    case v10 = "v1.0"
    case v11 = "v1.1"
}

enum Orbit: String, Codable {
    case esL1 = "ES-L1"
    case gto = "GTO"
    case hco = "HCO"
    case heo = "HEO"
    case iss = "ISS"
    case leo = "LEO"
    case po = "PO"
    case sso = "SSO"
}

enum ReferenceSystem: String, Codable {
    case geocentric = "geocentric"
    case heliocentric = "heliocentric"
    case highlyElliptical = "highly-elliptical"
}

enum Regime: String, Codable {
    case geostationary = "geostationary"
    case geosynchronous = "geosynchronous"
    case highEarth = "high-earth"
    case l1Point = "L1-point"
    case lowEarth = "low-earth"
    case sunSynchronous = "sun-synchronous"
}

enum PayloadType: String, Codable {
    case dragon10 = "Dragon 1.0"
    case dragon11 = "Dragon 1.1"
    case dragonBoilerplate = "Dragon Boilerplate"
    case satellite = "Satellite"
}

enum TentativeMaxPrecision: String, Codable {
    case hour
}
