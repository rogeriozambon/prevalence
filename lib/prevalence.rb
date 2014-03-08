require "prevalence/dump"
require "prevalence/file_handler"
require "prevalence/transaction"

module Prevalence
  class System
    attr_reader :object

    def initialize(object, path)
      @object = Transaction.new(path).restore || object
      @path = path
    end

    def execute(object)
      Transaction.new(@path).write(object)
      @object = object
    end
  end
end


