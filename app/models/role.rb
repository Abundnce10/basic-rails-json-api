class Role < ActiveRecord::Base
	has_one :api_key
end
