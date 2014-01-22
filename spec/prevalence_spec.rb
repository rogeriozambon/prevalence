require "spec_helper"

class Person
  attr_reader :data

  def initialize
    @data = []
  end

  def <<(data)
    @data << data
  end
end

describe "Prevalence" do
  before do
    @data = {
      "name" => "John Doe",
      "age" => 20
    }

    @person = Person.new
    @person << @data
  end

  describe "query interface" do
    before do
      Prevalence::System.new(@person, storage).take_snapshot
    end

    it "without an iterator" do
      person = Prevalence::System.new(Person.new, storage).recover_snapshot

      expect(person.data).to eq([@data])
    end

    it "with an iterator" do
      person = Prevalence::System.new(Person.new, storage).recover_snapshot
      person = person.data.select do |element|
        element["age"] == 21
      end

      expect(person).to be_empty
    end
  end

  it "snapshot of object state" do
    Prevalence::System.new(Person.new, storage).take_snapshot

    person = Prevalence::System.new(Person.new, storage).recover_snapshot

    expect(person.data).to be_empty
  end
end
