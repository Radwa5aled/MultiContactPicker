

Pod::Spec.new do |s|

  s.name         = "MultiContactPicker"
  s.version      = "1.0.0"
  s.summary      = "Multi Contact Picker  gives you the ability to access your contacts and return CNContact list"

 
  s.description  = "Multi Contact Picker  gives you the ability to access your contacts and return CNContact list, search,  select more than contact and view details of each contact"


 
    s.license      = "MIT"
    s.author             = { "Radwa Khaled" => "raadwa.khaled@gmail.com" }
    s.social_media_url   = "http://facebook.com/radwa.khaled.526"

  
    s.platform     = :ios, "11.0"

     s.source       = { :path => '.' }

    s.source_files  = "MultiContactPicker", "MultiContactPicker/**/*.{h,m,swift}"
 
    s.resources = "MultiContactPicker/*.png"

   s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }
 

end
