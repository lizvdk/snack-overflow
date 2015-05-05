require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:blank_values) { [nil, ""] }

  it { should belong_to(:user) }
  
  describe "#title" do
    it { should have_valid(:title).when("xxxx", "#{ 'x' * 100 }") }
    it { should_not have_valid(:title).when("xxx", "#{ 'x' * 101 }", *blank_values) }
  end
end
