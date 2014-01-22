require "bundler/setup"
Bundler.require :default, :development

require "prevalence"

RSpec.configure do |config|
  config.after(:each) do
    File.delete(filename) if File.exists?(filename)
    Dir.delete(storage)
  end
end

def storage
  @storage ||= File.dirname(__FILE__) + "/storage"
end

def filename
  @filename ||= "#{storage}/person.json"
end
