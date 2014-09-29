class WikiPage < ActiveRecord::Base
   versioned
   attr_accessible :title, :content

   validates_uniqueness_of  :title
    
end
