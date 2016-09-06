CrawlerService = Struct.new(:request) do
  require 'open-uri'

  def crawl_data
  	begin
	  	doc = Nokogiri::HTML(open(request.url))
			doc.css('h2,h1,h3,a').each do |link|
				value = link.attributes["href"].present? ? link.attributes["href"].value : ""
				
				if link.name == 'a'
					request.tags.create(name: link.name, text: link.children.text.strip, url: value)
				else
					request.tags.create(name: link.name, text: link.children.text.strip)
				end
			
			end
		rescue OpenURI::HTTPError => error
			response = error.io
  		response.status
  		response.string
		end
  end
end
