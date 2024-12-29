//
//  StarlinkMock.swift
//  SpaceXplorerTests
//
//  Created by Alex Lin Segarra on 29/12/24.
//

import Foundation

struct StarlinkMock {
    static func makeJsonMock() -> Data {
        """
        [
          {
            "spaceTrack": {
              "CCSDS_OMM_VERS": "2.0",
              "COMMENT": "GENERATED VIA SPACE-TRACK.ORG API",
              "CREATION_DATE": "2020-10-13T04:16:08",
              "ORIGINATOR": "18 SPCS",
              "OBJECT_NAME": "STARLINK-30",
              "OBJECT_ID": "2019-029K",
              "CENTER_NAME": "EARTH",
              "REF_FRAME": "TEME",
              "TIME_SYSTEM": "UTC",
              "MEAN_ELEMENT_THEORY": "SGP4",
              "EPOCH": "2020-10-13T02:56:59.566560",
              "MEAN_MOTION": 16.43170483,
              "ECCENTRICITY": 0.0003711,
              "INCLINATION": 52.9708,
              "RA_OF_ASC_NODE": 332.0356,
              "ARG_OF_PERICENTER": 120.7278,
              "MEAN_ANOMALY": 242.0157,
              "EPHEMERIS_TYPE": 0,
              "CLASSIFICATION_TYPE": "U",
              "NORAD_CAT_ID": 44244,
              "ELEMENT_SET_NO": 999,
              "REV_AT_EPOCH": 7775,
              "BSTAR": 0.0022139,
              "MEAN_MOTION_DOT": 0.47180237,
              "MEAN_MOTION_DDOT": 0.000012426,
              "SEMIMAJOR_AXIS": 6535.519,
              "PERIOD": 87.635,
              "APOAPSIS": 159.809,
              "PERIAPSIS": 154.958,
              "OBJECT_TYPE": "PAYLOAD",
              "RCS_SIZE": "LARGE",
              "COUNTRY_CODE": "US",
              "LAUNCH_DATE": "2019-05-24",
              "SITE": "AFETR",
              "DECAY_DATE": "2020-10-13",
              "DECAYED": 1,
              "FILE": 2850561,
              "GP_ID": 163365918,
              "TLE_LINE0": "0 STARLINK-30",
              "TLE_LINE1": "1 44244U 19029K   20287.12291165  .47180237  12426-4  22139-2 0  9995",
              "TLE_LINE2": "2 44244  52.9708 332.0356 0003711 120.7278 242.0157 16.43170483 77756"
            },
            "launch": "5eb87d30ffd86e000604b378",
            "version": "v0.9",
            "height_km": null,
            "latitude": null,
            "longitude": null,
            "velocity_kms": null,
            "id": "5eed770f096e59000698560d"
          },
          {
            "spaceTrack": {
              "CCSDS_OMM_VERS": "2.0",
              "COMMENT": "GENERATED VIA SPACE-TRACK.ORG API",
              "CREATION_DATE": "2020-09-28T19:26:08",
              "ORIGINATOR": "18 SPCS",
              "OBJECT_NAME": "STARLINK-74",
              "OBJECT_ID": "2019-029BL",
              "CENTER_NAME": "EARTH",
              "REF_FRAME": "TEME",
              "TIME_SYSTEM": "UTC",
              "MEAN_ELEMENT_THEORY": "SGP4",
              "EPOCH": "2020-09-28T18:35:08.710368",
              "MEAN_MOTION": 16.29892189,
              "ECCENTRICITY": 0.0002076,
              "INCLINATION": 52.9971,
              "RA_OF_ASC_NODE": 48.1405,
              "ARG_OF_PERICENTER": 323.1313,
              "MEAN_ANOMALY": 37.5805,
              "EPHEMERIS_TYPE": 0,
              "CLASSIFICATION_TYPE": "U",
              "NORAD_CAT_ID": 44293,
              "ELEMENT_SET_NO": 999,
              "REV_AT_EPOCH": 7653,
              "BSTAR": 0.0024534,
              "MEAN_MOTION_DOT": 0.1135935,
              "MEAN_MOTION_DDOT": 0.000012115,
              "SEMIMAJOR_AXIS": 6570.966,
              "PERIOD": 88.349,
              "APOAPSIS": 194.195,
              "PERIAPSIS": 191.467,
              "OBJECT_TYPE": "PAYLOAD",
              "RCS_SIZE": "LARGE",
              "COUNTRY_CODE": "US",
              "LAUNCH_DATE": "2019-05-24",
              "SITE": "AFETR",
              "DECAY_DATE": "2020-09-29",
              "DECAYED": 1,
              "FILE": 2837086,
              "GP_ID": 162391575,
              "TLE_LINE0": "0 STARLINK-74",
              "TLE_LINE1": "1 44293U 19029BL  20272.77440637  .11359350  12115-4  24534-2 0  9995",
              "TLE_LINE2": "2 44293  52.9971  48.1405 0002076 323.1313  37.5805 16.29892189 76534"
            },
            "launch": "5eb87d30ffd86e000604b378",
            "version": "v0.9",
            "height_km": null,
            "latitude": null,
            "longitude": null,
            "velocity_kms": null,
            "id": "5eed770f096e59000698560e"
          },
          {
            "spaceTrack": {
              "CCSDS_OMM_VERS": "2.0",
              "COMMENT": "GENERATED VIA SPACE-TRACK.ORG API",
              "CREATION_DATE": "2020-10-13T17:46:09",
              "ORIGINATOR": "18 SPCS",
              "OBJECT_NAME": "STARLINK-29",
              "OBJECT_ID": "2019-029J",
              "CENTER_NAME": "EARTH",
              "REF_FRAME": "TEME",
              "TIME_SYSTEM": "UTC",
              "MEAN_ELEMENT_THEORY": "SGP4",
              "EPOCH": "2020-10-13T17:09:39.946752",
              "MEAN_MOTION": 16.50981164,
              "ECCENTRICITY": 0.0008105,
              "INCLINATION": 52.9786,
              "RA_OF_ASC_NODE": 228.8138,
              "ARG_OF_PERICENTER": 330.1078,
              "MEAN_ANOMALY": 31.0927,
              "EPHEMERIS_TYPE": 0,
              "CLASSIFICATION_TYPE": "U",
              "NORAD_CAT_ID": 44243,
              "ELEMENT_SET_NO": 999,
              "REV_AT_EPOCH": 7928,
              "BSTAR": 0.00010982,
              "MEAN_MOTION_DOT": 0.11982673,
              "MEAN_MOTION_DDOT": 0.000012791,
              "SEMIMAJOR_AXIS": 6514.89,
              "PERIOD": 87.22,
              "APOAPSIS": 142.035,
              "PERIAPSIS": 131.474,
              "OBJECT_TYPE": "PAYLOAD",
              "RCS_SIZE": "LARGE",
              "COUNTRY_CODE": "US",
              "LAUNCH_DATE": "2019-05-24",
              "SITE": "AFETR",
              "DECAY_DATE": "2020-10-13",
              "DECAYED": 1,
              "FILE": 2851295,
              "GP_ID": 163381397,
              "TLE_LINE0": "0 STARLINK-29",
              "TLE_LINE1": "1 44243U 19029J   20287.71504568  .11982673  12791-4  10982-3 0  9997",
              "TLE_LINE2": "2 44243  52.9786 228.8138 0008105 330.1078  31.0927 16.50981164 79283"
            },
            "launch": "5eb87d30ffd86e000604b378",
            "version": "v0.9",
            "height_km": null,
            "latitude": null,
            "longitude": null,
            "velocity_kms": null,
            "id": "5eed770f096e59000698560f"
          }
        ]
        """.data(using: .utf8)!
    }
}
