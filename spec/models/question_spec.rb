require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:blank_values) { [nil, ""] }

  it { should belong_to(:user) }
  it { should have_many(:answers) }


  describe "#title" do
    it { should have_valid(:title).when("xxxx", "#{ 'x' * 100 }") }
    it { should_not have_valid(:title).when("xxx", "#{ 'x' * 101 }", *blank_values) }
  end

  describe "#description" do
    it { should have_valid(:description).when(*blank_values, "#{ 'x' * 2000 }") }
    it { should_not have_valid(:description).when("#{ 'x' * 2001 }") }
  end
end
