Pod::Spec.new do |s|
  s.name             = 'secp256k1.swift'
  s.version          = '0.1.0'
  s.summary          = 'secp256k1 bindings for swift. Cocoapods, SPM support. Linux support.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pod binds the bitcoin-core library, the ECDSA curve, secp256k1 into Swift. This curve is used for
Bitcoin, Ethereum and many other Cryptocurrency Signature generation and verification.
                       DESC

  s.homepage         = 'https://github.com/zhangliugang/secp256k1.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koray Koska' => 'koray@koska.at' }
  s.source           = { :git => 'https://github.com/zhangliugang/secp256k1.swift.git', :tag => s.version.to_s, :submodules => true }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.13'

  s.module_name = 'secp256k1'

  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}',
    'OTHER_CFLAGS' => '-DENABLE_MODULE_ECDH -DENABLE_MODULE_RECOVERY -DENABLE_MODULE_EXTRAKEYS -DENABLE_MODULE_SCHNORRSIG -pedantic -Wall -Wextra -Wcast-align -Wnested-externs -Wshadow -Wstrict-prototypes -Wno-shorten-64-to-32 -Wno-conditional-uninitialized -Wno-unused-function -Wno-long-long -Wno-overlength-strings -O3',
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Sources/secp256k1"'
  }

  s.source_files = 'Sources/secp256k1/{src,include,contrib}/*.{h,c}', 'Sources/secp256k1/src/modules/{recovery,ecdh,extrakeys,schnorrsig}/*.{h,c}'
  s.public_header_files = 'Sources/secp256k1/include/*.h'
  #s.private_header_files = 'Sources/secp256k1/*.h', 'Sources/secp256k1/{contrib,src}/*.h', 'Sources/secp256k1/src/modules/{recovery, ecdh, extrakeys, schnorrsig}/*.h'
  s.exclude_files = 'Sources/secp256k1/src/*test*.{c,h}', 'Sources/secp256k1/src/gen_context.c', 'Sources/secp256k1/src/*bench*.{c,h}', 'Sources/secp256k1/src/precompute_ecmult*.{c,h}', 'Sources/secp256k1/src/modules/{recovery,ecdh,extrakeys,schnorrsig}/*test*.{c,h}', 'Sources/secp256k1/src/modules/{recovery,ecdh,extrakeys,schnorrsig}/*bench*.{c,h}'
end
