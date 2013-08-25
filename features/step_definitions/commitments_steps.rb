Given(/^there are no commitments$/) do
  FileUtils.rm_rf("test")
end

Given(/^a commitment named "(.*?)" exists$/) do |commitment|
  FileUtils.mkdir_p("tmp/aruba/test")
  FileUtils.cp_r("tmp/#{commitment}","tmp/aruba/test/#{commitment}")
end

Given(/^"(.*?)" was started today$/) do |commitment|
  data = YAML::load(File.open(File.join("tmp/aruba/test", commitment, 'config.yml')))
  now = Time.now
  data['started_on'] = now
  data['last_checkin'] = nil
  File.open(File.join("tmp/aruba/test", commitment, 'config.yml'), 'w') { |f| YAML.dump(data, f) }
end

Given(/^"(.*?)" last checkin was (\d+) days ago$/) do |commitment, days|
  data = YAML::load(File.open(File.join("tmp/aruba/test", commitment, 'config.yml')))
  now = Time.now
  data['last_checkin'] = now - (60 * 60 * 24 * days.to_i)
  File.open(File.join("tmp/aruba/test", commitment, 'config.yml'), 'w') { |f| YAML.dump(data, f) }
end
