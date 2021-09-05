class Api::V1::ClustersController < ApiController
  include Concerns::UserAuthentication

  def index
  	json = {}
  	data = cluster_params || {}
  	Cluster.create!(user_id: current_user.id, data: data)
    success(json)
  end

  private
  def cluster_params
    params.require(:data)
  end
end
