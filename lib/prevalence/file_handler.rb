module Prevalence
  class FileHandler
    def initialize(path)
      @path = path

      create_file_to_transactions
    end

    def write(data)
      File.open(@path, "wb") do |file|
        file.write(data)
      end
    end

    def read
      File.read(@path)
    end

    private
    def create_file_to_transactions
      File.open(@path, "wb") unless File.exists?(@path)
    end
  end
end
