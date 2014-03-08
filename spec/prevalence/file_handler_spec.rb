require "spec_helper"

describe "FileHandler" do
  it "write something into the file" do
    file_handler = Prevalence::FileHandler.new(filename)
    file_handler.write("some text")

    expect(file_handler.read).to eq("some text")
  end
end
