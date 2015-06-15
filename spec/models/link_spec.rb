require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { Link.new(long_url: "www.google.com") }

  it { should validate_presence_of(:long_url) }
  it { should validate_presence_of(:short_url) }
end
