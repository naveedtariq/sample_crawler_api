module Crawler
  class Information < Grape::API
    
    params do
      requires :url, type: String
    end
    
    post :crawl_url, rabl: "v1/crawler/crawl_url" do
    	@requested_url = UrlRequest.where(url: params[:url]).first_or_initialize
      if @requested_url.new_record? 
      	@requested_url.save!
      	CrawlerService.new(@requested_url).crawl_data
      end
    end

    get :get_all_urls, rabl: "v1/crawler/crawl_url" do
    	@requested_url = UrlRequest.all
    end
  end
end