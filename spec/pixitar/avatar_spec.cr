require "../spec_helper"

Spectator.describe Pixitar::Avatar do
  it "initializes with default values" do
    avatar = Pixitar::Avatar.new
    expect(avatar.assets_path).to end_with("public/assets/pixitar")
    expect(avatar.image_extension).to eq("png")
    expect(avatar.gender).to be_nil
  end

  it "validates genders" do
    avatar = Pixitar::Avatar.new
    expect(avatar.genders).to eq([:male, :female])
  end

  it "returns face parts in correct order" do
    avatar = Pixitar::Avatar.new
    expect(avatar.face_parts).to eq([:background, :clothes, :face, :hair, :mouth, :eye])
  end

  it "generates random gender" do
    avatar = Pixitar::Avatar.new
    100.times do
      expect(avatar.random_gender).to be_in([:male, :female])
    end
  end

  it "raises InvalidGenderError for invalid gender" do
    avatar = Pixitar::Avatar.new
    expect {
      avatar.generate_avatar(:invalid)
    }.to raise_error(Pixitar::Avatar::InvalidGenderError)
  end

  it "generates male avatar" do
    avatar = Pixitar::Avatar.new
    result = avatar.male_avatar
    expect(result).to start_with("/images/pixitar/avatar_")
    expect(result).to end_with(".png")
    expect(avatar.gender).to eq(:male)
  end

  it "generates female avatar" do
    avatar = Pixitar::Avatar.new
    result = avatar.female_avatar
    expect(result).to start_with("/images/pixitar/avatar_")
    expect(result).to end_with(".png")
    expect(avatar.gender).to eq(:female)
  end

  it "raises MissingImageFilesError when no assets found" do
    avatar = Pixitar::Avatar.new(assets_path: "/nonexistent/path")
    expect {
      avatar.generate_avatar(:male)
    }.to raise_error(Pixitar::Avatar::MissingImageFilesError)
  end

  it "accepts custom filename for generated avatar" do
    avatar = Pixitar::Avatar.new
    custom_filename = "custom_avatar.png"
    result = avatar.generate_avatar(:male, custom_filename)
    expect(result).to eq("/images/pixitar/#{custom_filename}")
  end

  it "generates unique filenames when not specified" do
    avatar = Pixitar::Avatar.new
    results = Set(String).new
    10.times do
      results << avatar.generate_avatar(:male)
    end
    expect(results.size).to eq(10)
  end
end
