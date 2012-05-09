class Shout < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body
  validates :body, presence: true
  
  #could use a scope as well but Matt prefers 
  def self.current
    order("created_at DESC")
  end
end
