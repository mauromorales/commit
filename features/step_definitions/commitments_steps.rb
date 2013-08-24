USER_PATH = File.expand_path("~/")
COMMITMENTS_PATH = File.join(USER_PATH, ".commitments")

Given(/^there are no commitments$/) do
  FileUtils.rm_rf(File.join(COMMITMENTS_PATH,"compartmentalize"))
end
