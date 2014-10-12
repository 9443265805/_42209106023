class WikiPage < ActiveRecord::Base
   versioned
   attr_accessible :title, :content, :author

   validates_uniqueness_of  :title
    
end
