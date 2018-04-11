require 'rails_helper'

describe Asteroid do
  let(:name) {"bob"}
  let(:id) {"45A"}
  let(:hazardous) {true}
  subject {Asteroid.new(name, id, hazardous) }

  it "get attributes and sets them as reader methos" do
    expect(subject.name).to eq("bob")
    expect(subject.neo_reference_id).to eq("45A")
    expect(subject.hazardous).to eq(true)
  end
end
