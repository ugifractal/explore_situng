require 'openssl'
require 'faraday'
require 'json'
require 'csv'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE    
r = Faraday.get("https://pemilu2019.kpu.go.id/static/json/wilayah/0.json")
result = JSON.parse(r.body)
File.open("provinsi.csv", "w+") do |f|
  # headers
  f.write("KPU ID, Provinsi\n")

  result.each do |kpu_id, dapil|
    puts "#{kpu_id} #{dapil['nama']}"
    f.write("#{kpu_id},#{dapil['nama']}\n")
  end
end
