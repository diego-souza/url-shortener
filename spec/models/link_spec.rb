require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { Link.new(long_url: "www.google.com") }

  it { should validate_presence_of(:long_url) }
  it { should validate_uniqueness_of(:long_url) }

  context "at creation" do
    it "should generate a code for a new url" do
      allow(subject).to receive(:random_string).and_return("ABC")
      subject.save
      expect(subject.code).to eq("ABC")
    end

    it "should generate a unique code" do
      second_subject = Link.new long_url: "www.yahoo.com.br"
      allow(subject).to receive(:random_string).and_return("ABC")
      allow(second_subject).to receive(:random_string).and_return("ABC", "DEF")

      subject.save!
      second_subject.save!
      expect(subject.code).to eq("ABC")
      expect(second_subject.code).to eq("DEF")
    end
  end
end
