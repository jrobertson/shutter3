Gem::Specification.new do |s|
  s.name = 'shutter3'
  s.version = '0.1.2'
  s.summary = 'Uses the command `hcidump --raw` (see bluez-hcidump) to ' + 
      'detect the bluetooth button events for a wireless bluetooth remote ' + 
      'control shutter button.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/shutter3.rb']
  s.signing_key = '../privatekeys/shutter3.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/shutter3'
end
