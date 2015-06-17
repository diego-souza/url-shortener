require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { Link.new FactoryGirl.attributes_for(:link) }

  it { should allow_value('http://www.google.com',
                          'http://www.google.com.br',
                          'http://www.bbc.co.uk',
                          'https://www.google.com',
                          'https://mail.google.com').for(:long_url) }
  it { should_not allow_value(nil,
                              'www.google.com',
                              'google',
                              '1234567',
                              'hHHp://www.bbc.co.uk',
                              'http://www..google.c').for(:long_url) }

  it "should validate uniqueness of long_url" do
    subject.save!
    should validate_uniqueness_of(:long_url)
  end

  context "at creation" do
    it "should generate a code for a new url" do
      allow(subject).to receive(:random_string).and_return("ABC")
      subject.save!
      expect(subject.code).to eq("ABC")
    end

    it "should generate a unique code" do
      second_subject = Link.new FactoryGirl.attributes_for(:link)
      allow(subject).to receive(:random_string).and_return("ABC")
      allow(second_subject).to receive(:random_string).and_return("ABC", "DEF")

      subject.save!
      second_subject.save!
      expect(subject.code).to eq("ABC")
      expect(second_subject.code).to eq("DEF")
    end

    it "should generate a random code" do
      allow(subject).to receive(:rand).and_return(0, 1, 2, 3, 4, 5, 6, 7)
      subject.save!
      expect(subject.code).to eq("ABCDEFGH")
    end

    it "should add http:// to long_url if it doesn't have it already" do
      subject.long_url = "www.google.com"
      subject.save!
      expect(subject.long_url).to eq("http://www.google.com")
    end

    it "should not change if it has http://" do
      subject.long_url = "http://www.google.com"
      subject.save!
      expect(subject.long_url).to eq(subject.long_url)
    end

    it "should not change if it has https://" do
      subject.long_url = "https://www.google.com"
      subject.save!
      expect(subject.long_url).to eq(subject.long_url)
    end
  end
end
