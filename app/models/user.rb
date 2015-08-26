class User < ActiveRecord::Base
  has_many :urls
  # Remember to create a migration!

  validates :email, uniqueness:true
  
end
