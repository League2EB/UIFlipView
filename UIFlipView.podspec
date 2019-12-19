Pod::Spec.new do |s|
  s.name             = 'UIFlipView'
  s.version          = '1.0.0'
  s.summary          = 'UIView翻轉動畫'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/League2EB/UIFlipView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'League2EB' => 'Lazy@Lazy.com' }
  s.source           = { :git => 'https://github.com/League2EB/UIFlipView.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'UIFlipView/Classes/**/*'

end
