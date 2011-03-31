class Ministry < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description, :location, :webpage, :phone, :email]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :image
end
