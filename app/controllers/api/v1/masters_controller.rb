class Api::V1::MastersController < ApiController
  include Concerns::UserAuthentication

  def index
    json = {
	  "vaccinator_name": "Hafiz",
	  "health_facility_name": "Facility 1",
	  "current_month_data": [
	    {
	      "label": "Model Town",
	      "percent": "20%",
	      "date": "24-03-2021",
	      "already_visit": "true"
	    },
	    {
	      "label": "Luban Wala",
	      "percent": "20%",
	      "date": "30-08-2021",
	      "already_visit": "false"
	    },
	    {
	      "label": "Mandili",
	      "percent": "11%",
	      "date": "24-03-2021",
	      "already_visit": "false"
	    }
	  ]
	}
    success(json)
  end
end
