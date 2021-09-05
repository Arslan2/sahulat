class Tehsil < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :ucs, dependent: :destroy

end
