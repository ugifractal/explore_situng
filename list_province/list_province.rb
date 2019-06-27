require 'openssl'
require 'faraday'
require 'json'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE    
r = Faraday.get("https://pemilu2019.kpu.go.id/static/json/wilayah/0.json")
result = JSON.parse(r.body)
result.each do |kpu_id, dapil|
  puts "#{kpu_id} #{dapil['nama']}"
end
