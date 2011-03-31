require 'spec_helper'

describe Training do

  def reset_training(options = {})
    @valid_attributes = {
      :id => 1,
      :focus => "RSpec is great for testing too"
    }

    @training.destroy! if @training
    @training = Training.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_training
  end

  context "validations" do
    
    it "rejects empty focus" do
      Training.new(@valid_attributes.merge(:focus => "")).should_not be_valid
    end

    it "rejects non unique focus" do
      # as one gets created before each spec by reset_training
      Training.new(@valid_attributes).should_not be_valid
    end
    
  end

end