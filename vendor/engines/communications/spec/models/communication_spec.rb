require 'spec_helper'

describe Communication do

  def reset_communication(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @communication.destroy! if @communication
    @communication = Communication.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_communication
  end

  context "validations" do
    
    it "rejects empty title" do
      Communication.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_communication
      Communication.new(@valid_attributes).should_not be_valid
    end
    
  end

end