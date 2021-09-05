class Api::V1::TehsilsController < ApiController
  include Concerns::UserAuthentication

  def index
    json = {
		  "tehsil_names": [
		    {
		      "id": "1",
		      "name": "Kasur"
		    },
		    {
		      "id": "2",
		      "name": "KRS"
		    },
		    {
		      "id": "3",
		      "name": "Pattoki"
		    },
		    {
		      "id": "4",
		      "name": "Chunian"
		    }
		  ]
		}
    success(json)
  end
end
