require 'spec_helper'

describe Ministry do

  def reset_ministry(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @ministry.destroy! if @ministry
    @ministry = Ministry.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_ministry
  end

  context "validations" do
    
    it "rejects empty title" do
      Ministry.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_ministry
      Ministry.new(@valid_attributes).should_not be_valid
    end
    
  end

end