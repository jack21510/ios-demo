# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'IQKeyboardManager'
  pod 'Moya'
  pod 'SVProgressHUD'
  pod 'Kingfisher'
  pod 'UICircularProgressRing'
  pod 'iCarousel'
  pod 'Segmentio'
  pod 'lottie-ios'
  # Google套件
  pod 'GoogleSignIn'
  pod 'GoogleSignInSwiftSupport'
end



target 'iosDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  common_pods
  
  
  # Pods for iosDemo

  target 'iosDemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'iosDemoUITests' do
    # Pods for testing
  end

end

target 'iosDemo_dev' do
  use_frameworks!

  common_pods
  
end
