module Prevalence
  class Transaction
    def initialize(path)
      @file_handler = FileHandler.new(path)
    end

    def restore
      transaction = @file_handler.read

      unless transaction.empty?
        Dump.deserialize(transaction)
      end
    end

    def write(transaction)
      @file_handler.write(Dump.serialize(transaction))
    end
  end
end
