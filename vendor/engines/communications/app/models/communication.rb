class Communication < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body, :excerpt]

  validates :title, :presence => true, :uniqueness => true
  
end
