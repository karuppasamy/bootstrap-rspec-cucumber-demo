require 'spec_helper'

describe Post do

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(5) }
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(10) }

  describe "creation" do
    context "valid attributes" do
      it "should be valid" do
        post = FactoryGirl.build(:post)
        post.should be_valid
      end
    end

    context "invalid attributes" do
      it "should not be valid" do
        post = FactoryGirl.build(:post, name: "")
        post.should_not be_valid
      end
    end
  end

  describe "name validation" do
    context "name is present" do
      before(:each) do
        @post = Post.new(name: "My first post")
      end

      it "does not add an error on the 'name' attribute" do
        @post.should have(0).error_on(:name)

        # @post.valid?
        # expect(@post.errors[:name].size).to eq(0)
      end
    end

    context "name is not present" do
      before(:each) do
        @post = Post.new
      end

      it "adds an error on the 'name' attribute" do
        @post.should have(2).error_on(:name)
      end
    end
  end
end
