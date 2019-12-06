class Api::V1::UsersController < ApiController
  include Concerns::UserAuthentication

  def index
    users = User.all
    success(data: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UserSerializer, scope: {current_user: @current_user}))
  end
end
