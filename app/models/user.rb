class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_identities, dependent: :destroy
  has_many :questions, dependent: :destroy

  scope :staff, -> { where(role: 'staff') }
  # validates :email, presence: true, uniqueness: true
  #validates_format_of :contact_person_number, :phone, :fax, with: /\(?[0-9]{3}\)? ?[0-9]{3}-[0-9]{4}/, message: "- must be in xxx-xxx-xxxx format."

  def full_name
    [self.first_name, self.last_name].join(' ')
  end

  def generate_access_token(device_id)
    user_identity = user_identities.find_or_create_by(device_id: device_id)
    user_identity.access_token
  end
end
