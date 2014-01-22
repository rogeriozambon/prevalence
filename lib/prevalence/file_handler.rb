module Prevalence
  class FileHandler
    def initialize(base, path)
      @base = base
      @path = path
    end

    def create_directory
      Dir.mkdir(@base) unless has_directory?
    end

    def create_file
      File.open(@path, "wb") unless has_file?
    end

    def write(data)
      File.open(@path, "wb") do |file|
        file.write(JSON.generate(data))
      end
    end

    def read
      snapshots = File.read(@path)

      return [] if snapshots.empty?

      JSON.parse(snapshots)
    end

    def empty?
      has_file? && read.empty?
    end

    def has_directory?
      File.directory?(@base)
    end

    def has_file?
      File.exists?(@path)
    end
  end
end
