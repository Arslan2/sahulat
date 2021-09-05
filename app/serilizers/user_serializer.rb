class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :created_at, :active, :role, :tehsil_id

  def tehsil_id
  	self.object.tehsils.last.try(:id)
  end
end
