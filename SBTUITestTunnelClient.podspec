Pod::Spec.new do |s|
    s.name             = "SBTUITestTunnelClient"
    s.version          = "5.3.0"
    s.summary          = "Enable network mocks and more in UI Tests"

    s.description      = <<-DESC
    Use this library to easily setup an HTTP tunnel between our UI Tests cases and the app under test.
    The tunnel allows to inject data in order to enabale network mocking.
    DESC

    s.homepage         = "https://github.com/Subito-it/SBTUITestTunnel"
    s.license          = 'Apache License, Version 2.0'
    s.author           = { "Tomas Camin" => "tomas.camin@adevinta.com" }
    s.source           = { :git => "https://github.com/antigp/SBTUITestTunnel.git", :branch => "master" }

    s.platform = :ios, '9.0'
    s.requires_arc = true
    s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
    s.pod_target_xcconfig = { :prebuild_configuration => 'debug' }
    s.library = 'z'

    s.frameworks = 'XCTest'
    s.source_files = 'Pod/Client/**/*.{h,m}'
    s.private_header_files = 'Pod/Client/Private/*.h'

    s.dependency 'SBTUITestTunnelCommon'

    # Used only for testing purposes
    s.subspec 'Connectionless' do |client|
        client.source_files = 'Pod/Client/**/*.{h,m}'
        client.private_header_files = 'Pod/Client/Private/*.h'
        client.dependency 'SBTUITestTunnelServer'
    end
end
