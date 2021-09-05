class Api::V1::UcsController < ApiController
  include Concerns::UserAuthentication

  def index
  	json = {}

  	if current_user.phone == "asv.pattoki"
	    json = {
		  "uc_names": [
		    {
		      "id": "1",
		      "name": "UC1",
		      "session_type": "Fixed Station",
		      "last_visit_date": "",
		      "last_visit_by": " ",
		      "already_visit": ""
		    },
		    {
		      "id": "2",
		      "name": "UC2",
		      "session_type": "Outreach",
		      "last_visit_date": "",
		      "last_visit_by": "",
		      "already_visit": "false"
		    }
		  ]
		}
	elsif current_user.phone == "asv.kasur"    
		json = {
		  "uc_names": [
		    {
		      "id": "1",
		      "name": "UC1",
		      "session_type": "Fixed Station",
		      "last_visit_date": "",
		      "last_visit_by": "",
		      "already_visit": "false"
		    },
		    {
		      "id": "2",
		      "name": "UC2",
		      "session_type": "Outreach",
		      "last_visit_date": "",
		      "last_visit_by": "",
		      "already_visit": "false"
		    }
		  ]
		}
	end

    success(json)
  end
end
