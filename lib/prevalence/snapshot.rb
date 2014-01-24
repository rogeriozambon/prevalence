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

      file_hanler.create_directory
      file_hanler.create_file
    end

    def create
      file_hanler.write({
        "object" => Marshal.dump(@object).bytes.join(","),
        "created_at" => Time.now
      })
    end

    def last
      return @object if file_hanler.empty_file?

      object = file_hanler.read.last["object"]
      object = object.split(",").map(&:to_i)

      Marshal.load(object.pack("C*"))
    end

    private
    def file_name
      @object.class.name.downcase
    end

    def file_hanler
      @file_hanler ||= FileHandler.new(@base, "#{@base}/#{file_name}.json")
    end
  end
end
