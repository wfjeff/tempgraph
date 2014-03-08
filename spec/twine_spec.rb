require_relative "spec_helper"

describe Twine do
  let!(:reading1) { Reading.create(twine: subject, temp: 74) }
  let!(:reading2) { Reading.create(twine: subject, temp: 75) }
  it "has readings" do
    expect(subject.readings).to include(reading1)
    expect(subject.readings).to include(reading2)
  end

  describe "#chart_hash" do 
    context 'when it has readings' do
      it "produces a graphable readings hash" do
        expect(subject.chart_hash).to eq(reading1.created_at => 74, reading2.created_at => 75)
      end
    end
      
    context 'when it has no readings' do
      it "produces an empty hash" do
        expect(Twine.new.chart_hash).to eq({})
      end
    end
  end

  describe "#get_reading" do
    it "makes a new reading" do
      reading = subject.get_reading
      expect(reading).to be_an_instance_of(Reading)
    end
  end
end