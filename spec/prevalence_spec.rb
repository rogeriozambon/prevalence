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
  it "returns the same object" do
    prevalence = Prevalence::System.new(Person.new, filename)

    expect(prevalence.object).to be_a(Person)
  end

  it "stores the object state" do
    prevalence = Prevalence::System.new(Person.new, filename)

    person = Person.new
    person << { name: "John Doe" }

    prevalence.execute(person)

    expect(prevalence.object.data).to eq([{ name: "John Doe" }])
  end
end
