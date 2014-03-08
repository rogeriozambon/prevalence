require "bundler/setup"
Bundler.require :default, :development

require "prevalence"

RSpec.configure do |config|
  config.after(:each) do
    File.delete(filename) if File.exists?(filename)
  end
end

def filename
  File.dirname(__FILE__) + "/person.dump"
end
