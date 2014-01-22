module Prevalence
  class Snapshot
    def self.take(base, object)
      new(base, object).create
    end

    def self.recover(base, object)
      new(base, object).last
    end

    def initialize(base, object)
      @base = base
      @object = object

      setup
    end

    def create
      file_hanler.write(file_hanler.read.push(data))
    end

    def last
      return @object if file_hanler.empty?

      Marshal.load(file_hanler.read.last["object"])
    end

    private
    def setup
      file_hanler.create_directory
      file_hanler.create_file
    end

    def file_hanler
      @file_hanler ||= FileHandler.new(@base, path)
    end

    def path
      "#{@base}/#{file_name}.json"
    end

    def file_name
      @object.class.name.downcase
    end

    def data
      {
        "object" => Marshal.dump(@object),
        "created_at" => Time.now
      }
    end
  end
end
