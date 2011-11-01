require 'rubygems'
require 'open-uri'
require 'xmlsimple'

module SkiReport

	def self.fetch(state)
		state.downcase!.gsub!(/[ ]/,'-')
    url = "http://www.onthesnow.com/#{state}/snow.rss"
    src = ""; file = open(url) { |f| f.each_line { |line| src += line.gsub(/ots:/, '') }}
		feed = XmlSimple.xml_in(src)['channel'][0]['item']
		SkiReport::Report.new feed
	end

	class Report
	  def initialize(feed)
			@feed = feed
	  end

		def resorts
	    @feed.collect do |item|
	      SkiReport::Resort.new({ 
					:name 			=> item['title'],
	        :updated 		=> item['pubDate'],
	        :status 		=> item['open_staus'],
        	:conditions => item['surface_condition'],
	        :base				=> { :depth => item['base_depth'], :metric => item['base_depth_metric'] },
	        :snowfall 	=> { :amount => item['snowfall_48hr'], :metric => item['snowfall_48hr_metric'] }
				})
	    end
		end
	end
		
	class Resort
		def initialize(attributes)
			@attributes = attributes
		end
		
	  ['name','updated','status','base','snowfall','conditions','metric'].each do |arg|
	    send :define_method, arg.to_sym do
	      @attributes[arg] || @attributes[arg.to_sym]
	    end
	  end
	end
end