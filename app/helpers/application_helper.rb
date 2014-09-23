module ApplicationHelper
 def wiki_link(content)
    content.gsub(/[A-Z]\w+[A-Z]\w+/) do |word|
      link_to word, named_wiki_pages_path(:title=>word)
    end
  end
def markdown(text)
  options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
  #:hard_wrap=>true, :filter_html=>true, :autolink=>true, :no_intraemphasis=>true, :fenced_code=>true, :gh_blockcode=>true
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,:hard_wrap=>true, :filter_html=>true, :autolink=>true, :no_intraemphasis=>true, :fenced_code=>true, :gh_blockcode=>true)
  syntax_highlighter(markdown.render(text)).html_safe
end

def syntax_highlighter(html)
  doc = Nokogiri::HTML(html)
  doc.search("//pre[@lang]").each do |pre|
    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  end
  doc.to_s
end
end
