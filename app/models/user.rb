class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :user_identities, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :clusters, dependent: :destroy

  scope :staff, -> { where(role: 'staff') }
  validates :phone, presence: true, uniqueness: true
  #validates_format_of :phone, with: /[0-9]{12}/, message: "- must be in 92-xxx-xxxxxxx format."

  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def generate_access_token(device_id)
    user_identity = user_identities.find_or_create_by(device_id: device_id)
    user_identity.access_token
  end

  def confirmation_required?
    false
  end
end
