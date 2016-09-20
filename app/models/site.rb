class Site < ApplicationRecord
  belongs_to :theme

def remove_site
	remove_instance_variable(:@site)
end

end
