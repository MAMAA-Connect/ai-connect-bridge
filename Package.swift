// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ai-connect-bridge",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AIConnectBridge",
            targets: ["AIConnectBridge"]),
    ],
    dependencies: [
        // Adicione dependências globais aqui se necessário (ex: Alamofire, OpenAI SDKs)
    ],
    targets: [
        .target(
            name: "AIConnectBridge",
            dependencies: []),
        .testTarget(
            name: "AIConnectBridgeTests",
            dependencies: ["AIConnectBridge"]),
    ]
)
