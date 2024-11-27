# spec/pixitar_spec.cr
require "../src/pixitar"
require "spectator"

Spectator.describe Pixitar::Avatar do
  context "when generating an avatar" do
    it "generates a valid PNG file" do
      avatar = Pixitar::Avatar.new
      filename = "test_avatar.png"
      avatar.generate_avatar(:male, filename)

      expect(File.exists?(filename)).to be_true
    end

    it "raises an error for invalid gender" do
      avatar = Pixitar::Avatar.new
      expect_raises(Pixitar::Avatar::InvalidGenderError) do
        avatar.generate_avatar(:invalid_gender)
      end
    end
  end
end
