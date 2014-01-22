require "spec_helper"

describe "FileHandler" do
  it "verifies directory creation" do
    file_handler = Prevalence::FileHandler.new(storage, filename)
    file_handler.create_directory

    expect(file_handler.has_directory?).to be_true
  end

  it "verifies file creation" do
    file_handler = Prevalence::FileHandler.new(storage, filename)
    file_handler.create_directory
    file_handler.create_file

    expect(file_handler.has_file?).to be_true
  end

  it "write something into the file" do
    file_handler = Prevalence::FileHandler.new(storage, filename)
    file_handler.create_directory
    file_handler.create_file
    file_handler.write([{ "name" => "John Doe" }])

    expect(file_handler.empty_file?).to be_false
  end

  it "read something from file" do
    file_handler = Prevalence::FileHandler.new(storage, filename)
    file_handler.create_directory
    file_handler.create_file
    file_handler.write({ "name" => "John Doe" })

    expect(file_handler.read).to eq([{ "name" => "John Doe" }])
  end
end
