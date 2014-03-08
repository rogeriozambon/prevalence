module Prevalence
  class Dump
    def self.serialize(transaction)
      Marshal.dump(transaction).bytes.join(",")
    end

    def self.deserialize(transaction)
      Marshal.load(transaction.split(",").map(&:to_i).pack("C*"))
    end
  end
end
