require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    @links = assign(:links, [FactoryGirl.create(:link), FactoryGirl.create(:link)])
    @link = assign(:link, Link.new(FactoryGirl.attributes_for(:link)))
  end

  it "renders a list of links" do
    render
    assert_select "form[action=?][method=?]", links_path, "post" do
      assert_select "input#link_long_url[name=?]", "link[long_url]"
    end
    assert_select "tr>td", :text => @links.first.long_url, :count => 1
    assert_select "tr>td", :text => @links.last.long_url, :count => 1
  end
end
