require "spec_helper"

class Person
  attr_reader :data

  def initialize
    @data = []
  end

  def query
    @data
  end

  def execute(data)
    @data << data
  end
end

describe "Prevalence" do
  before do
    @data = { name: "John Doe", age: 20 }

    @person = Person.new
    @person.execute(@data)
  end

  describe "query interface" do
    it "without an iterator" do
      person = Prevalence::System.new(@person, storage)

      expect(person.query).to eq([@data])
    end

    it "with an iterator" do
      person = Prevalence::System.new(@person, storage)
      person = person.query.select do |element|
        element[:age] == 21
      end

      expect(person).to be_empty
    end
  end

  it "snapshot of object state" do
    Prevalence::System.new(Person.new, storage).take_snapshot

    person = Prevalence::System.new(Person.new, storage)

    expect(person.query).to be_empty
  end
end
