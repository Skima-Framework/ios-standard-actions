Pod::Spec.new do |s|
    s.name                  = 'SkimaStandardActions'
    s.version               = '0.1.0'
    s.homepage              = 'https://github.com/Skima-Framework/ios-standard-actions'
    s.summary               = 'Skima Standard Actions - module'
    s.license               = { :type => 'AGPL-3.0', :file => 'LICENSE' }
    s.author                = 'Skima Framework'
    s.source                = { :git => 'https://github.com/Skima-Framework/ios-standard-actions.git', :tag => s.version.to_s }
    
    s.platform              = :ios, '11.0'
    s.requires_arc          = true
    s.swift_version         = '5.1'
    s.static_framework      = true
    
    s.source_files          = 'SkimaStandardActions/**/*.{h,swift}'
  
    s.dependency 'Skima'
  
  end
  
