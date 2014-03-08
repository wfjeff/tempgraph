require_relative "spec_helper"

describe Reading do
  let(:reading) { Reading.new(temp: 75) }
  it "has a temperature" do
    expect(reading.temp).to eq(75)
  end

  it "has a timestamp" do
    reading.save
    expect(reading.created_at).to be_an_instance_of(Time)
  end
end