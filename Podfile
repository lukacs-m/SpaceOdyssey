# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

# Pods for SpaceOdyssey
def common_pods
    pod 'SwiftLint'
    pod 'Moya'
    pod 'PromiseKit'
    pod 'Kingfisher'
    pod 'SkeletonView'
    pod 'SnapKit'
    pod 'SwiftIcons'
    pod 'youtube-ios-player-helper'
end

# Pods for SpaceOdyssey Testing
def test_pods
    pod "Quick"
    pod "Nimble"
    pod "Nimble-Snapshots"
end


target 'SpaceOdyssey' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  common_pods

  # Pods for SpaceOdyssey

  target 'SpaceOdysseyTests' do
    inherit! :search_paths
    test_pods

  end

  target 'SpaceOdysseyUITests' do
    inherit! :search_paths
    test_pods

  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if ['Moya', 'SwiftIcons' ].include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
