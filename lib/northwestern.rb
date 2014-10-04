require 'net/http'
require 'uri'
require 'json'

module Northwestern
  BASE_URL = 'https://api.asg.northwestern.edu/'
  class << self
    def terms(params={})
      get('/terms', {})
    end

    def schools(params={})
      get('/schools', {})
    end

    def terms(params={})
      get('/terms', {})
    end

    def subjects(params={})
      get('/subjects', params)
    end

    def courses(params={})
      get('/courses', params)
    end

    def course_details(params={})
      get('/courses/details', params)
    end

    def instructors(params={})
      get('/instructors', params)
    end

    def rooms(params={})
      get('/rooms', params)
    end

    def room_details(params={})
      get('/rooms/details', params)
    end
  end

  def get(path, params)
    if defined? Config::API_KEY
      uri = URI(BASE_URL)
      uri.path = path
      uri.query = URI.encode_www_form(params.merge(
        { key: Config::API_KEY }
      ))

      JSON.parse(Net::HTTP.get(uri))
    else
      "Please set your API key (see readme)"
    end
  end
end
