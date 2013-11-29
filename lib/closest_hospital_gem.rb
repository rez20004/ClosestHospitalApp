require "closest_hospital_gem/version"
require 'net/http'
require 'httparty'

module ClosestHospitalGem
  def self.search lat, lon
    url = URI.parse(URI.encode("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&types=hospital|health|doctor&sensor=false&rankby=distance&key=AIzaSyDG1sETP6oYhAU4GFYZO8kZRH28KiffPlU"))
    request = Net::HTTP::Get.new(url.path)

    response = Net::HTTP.start(url.host, url.port, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
      http.request(request)
    end

    puts response.body
  end

     options = {
        :location => location,
        :name => name

    }

    if types
      types = (types.is_a?(Array) ? types.join('|') : types)
      options.merge!(:types => types)
    end

    mashup(self.class.get("/search/json", :query => options.merge(self.default_options)))
  end
end
