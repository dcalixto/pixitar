require "./spec_helper"
require "file_utils"

Spectator.describe "Install" do
  it "should have default installation path" do
    install_path = File.expand_path("~/.kemal")
    expect(File.exists?(install_path)).to be_false
  end

  it "should create installation directory" do
    temp_path = "/tmp/kemal_test_install"
    Dir.mkdir_p(temp_path)
    expect(File.directory?(temp_path)).to be_true
    FileUtils.rm_rf(temp_path)
  end

  it "should handle invalid installation paths" do
    invalid_path = ""
    expect_raises(Exception) do
      Dir.mkdir_p(invalid_path)
    end
  end

  it "should handle permissions" do
    restricted_path = "/root/kemal_test_#{Random.new.rand(10000)}"
    expect_raises(Exception, /Permission denied|Access is denied/) do
      FileUtils.mkdir_p(restricted_path)
    end
  end
end
