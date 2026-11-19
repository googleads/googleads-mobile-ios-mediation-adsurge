// swift-tools-version:5.6

// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "AdSurgeAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "AdSurgeAdapterTarget",
      targets: ["AdSurgeAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/ODCFrontend/adsurge-adn-ios.git",
      exact: "2.0.1"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    ),
  ],
  targets: [
    .target(
      name: "AdSurgeAdapterTarget",
      dependencies: [
        .target(name: "AdSurgeAdapter"),
        .product(name: "AdSurgeSDK", package: "adsurge-adn-ios"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "AdSurgeAdapterTarget"
    ),
    .binaryTarget(
      name: "AdSurgeAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/adsurge/AdSurgeAdapter-2.0.1.0.zip",
      checksum: "32e3f393a76a860fa8d408b3a7797d0fd60ef9ae25a41455c1b75654ea1b9b94"
    ),
  ]
)
