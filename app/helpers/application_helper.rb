module ApplicationHelper
 def wiki_link(content)
    content.gsub(/[A-Z]\w+[A-Z]\w+/) do |word|
      link_to word, named_wiki_pages_path(:title=>word)
    end
  end

end
