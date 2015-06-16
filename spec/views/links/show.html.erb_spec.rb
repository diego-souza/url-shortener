require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    @link = assign(:link, FactoryGirl.create(:link))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@link.long_url)
  end
end
