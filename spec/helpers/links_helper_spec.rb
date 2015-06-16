require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LinksHelper. For example:
#
# describe LinksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LinksHelper, type: :helper do
  context "#code_url" do
    it "should be the join of domain, port and code" do
      request_double = double(domain: "localhost", port: 3000)
      expect(helper.code_url(request_double, "ABC")).to eq("http://localhost:3000/ABC")
    end
  end
end
