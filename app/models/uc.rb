class Uc < ActiveRecord::Base
  belongs_to :tehsil

  has_many :master_plans, dependent: :destroy

end
