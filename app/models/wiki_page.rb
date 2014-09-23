class WikiPage < ActiveRecord::Base
   versioned
   attr_accessible :title, :content
    
end
