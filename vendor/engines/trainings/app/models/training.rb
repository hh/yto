class Training < ActiveRecord::Base

  acts_as_indexed :fields => [:focus, :outreach_location, :webpage, :leader, :description]

  validates :focus, :presence => true, :uniqueness => true
  
end
