class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone, :created_at, :active, :role, :tehsil_id

  def tehsil_id
  	id = self.object.tehsils.last.try(:id)

  	if self.object.phone == 'ddho.krk'
  		id = Tehsil.where(name: "KRK").last.try(:id)
  	end

  	id
  end
end
