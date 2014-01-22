require "json"
require "prevalence/file_handler"
require "prevalence/snapshot"

module Prevalence
  class System
    def initialize(object, base)
      @object = object
      @base = base
    end

    def take_snapshot
      Snapshot.take(@base, @object)
    end

    def recover_snapshot
      @object = Snapshot.recover(@base, @object)
    end
  end
end
