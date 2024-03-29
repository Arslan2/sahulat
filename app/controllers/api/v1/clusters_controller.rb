class Api::V1::ClustersController < ApiController
  include Concerns::UserAuthentication

  def create
  	json = {}
  	data = cluster_params.to_json || {}
  	Cluster.create!(user_id: current_user.id, data: data)
    success(json)
  end

  private
  def cluster_params
    params.require(:cluster).permit!
  end
end
