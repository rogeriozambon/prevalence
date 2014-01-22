require "spec_helper"

class Person
  attr_accessor :name
end

describe "Snapshot" do
  it "snapshot of object state" do
    Prevalence::Snapshot.take(storage, Person.new)

    content = JSON.parse(File.read("#{storage}/person.json"))

    expect(content).to be_an(Array)
    expect(content.first).to be_a(Hash)
    expect(content.first).to have_key("object")
    expect(content.first).to have_key("created_at")
  end

  it "recover object state" do
    person = Person.new
    person.name = "John Doe"

    Prevalence::Snapshot.take(storage, person)

    person = Prevalence::Snapshot.recover(storage, Person.new)

    expect(person).to be_a(Person)
    expect(person.name).to eq("John Doe")
  end
end
