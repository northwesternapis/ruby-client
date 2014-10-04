require 'net/http'
require 'uri'
require 'json'

module Northwestern
  BASE_URL = 'https://api.asg.northwestern.edu/'
  class << self
    def terms(params={})
      self.get('/terms', {})
    end

    def schools(params={})
      self.get('/schools', {})
    end

    def terms(params={})
      self.get('/terms', {})
    end

    def subjects(params={})
      self.get('/subjects', params)
    end

    def courses(params={})
      self.get('/courses', params)
    end

    def course_details(params={})
      self.get('/courses/details', params)
    end

    def instructors(params={})
      self.get('/instructors', params)
    end

    def rooms(params={})
      self.get('/rooms', params)
    end

    def room_details(params={})
      self.get('/rooms/details', params)
    end

    def get(path, params)
      if defined? Northwestern::Config::API_KEY
        uri = URI(BASE_URL)
        uri.path = path
        uri.query = URI.encode_www_form(params.merge(
          { key: Northwestern::Config::API_KEY }
        ))

        JSON.parse(Net::HTTP.get(uri))
      else
        "Please set your API key (see readme)"
      end
    end
  end
end
