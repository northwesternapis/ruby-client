# Northwestern API

A Ruby wrapper for the Northwestern Course data API.

## Installation

Add it to your Gemfile:

    gem 'northwestern-api'

run:

    $ bundle

Or install it yourself with:

    $ gem install northwestern-api

## Usage

You'll have to set your client ID somewhere, in some sort of config directory
should do nicely.  If you're using Rails try the `config` directory and make an
initializer.

Initialize the Key like so:

```
require 'northwestern-api'

module Northwestern
  class Config
    API_KEY = "###YOUR KEY GOES HERE###"
  end
end
```

Then you can use the API anywhere without making an instance of it. The
endpoints from the API are all available.  For `courses/details` and
`rooms/details` just use and underscore.

Pass a list of parameters (not including your API key) as a Ruby hash to the
method.  The resulting JSON is also parsed into Ruby Arrays and Hashes.

Use like so:

```ruby
require 'northwestern-api'

all_terms = Northwestern.terms
# => [{"id"=>4560, "name"=>"2014 Fall", "start_date"=>"2014-09-23",
# "end_date"=>"2014-12-12"}, ... ]

fall2014 = all_terms[0]["id"]

fall_eecs_courses = Northwestern.courses({ term: fall2014, subject: "EECS" })
# => [{"id"=>109680, "title"=>"An Introduction to Computer Science for
# Everyone", "term"=>"2014 Fall", "instructor"=>"Haoqi Zhang", "subject"=>"EECS",
# "catalog_num"=>"101-0", "section"=>"20", "room"=>"Annenberg Hall G15",
# "meeting_days"=>"MoWe", "start_time"=>"15:00", "end_time"=>"15:50",
# "seats"=>110, "topic"=>nil, "component"=>"LEC", "class_num"=>14597,
# "course_id"=>8093}, ... ]
```

## Issues

If you find an issue, please put up a Github Issue request.  If you have an idea
you think make the gem better or easier to use, feel free to run that by me too.
Run now it's a very thin wrapper around those functions.
