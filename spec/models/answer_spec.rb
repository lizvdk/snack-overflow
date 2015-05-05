require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:blank_values) { [nil, ""] }

  it { should belong_to(:user) }
  it { should belong_to(:question) }

  describe "#body" do
    it { should have_valid(:body).when("xxxxxxxxxx", "#{ 'x' * 1000 }") }
    it { should_not have_valid(:body).when("xxxxxxxxx", "#{ 'x' * 1001 }",
                                            *blank_values) }
  end
end
