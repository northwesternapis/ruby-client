# Northwestern API

A Ruby wrapper for the Northwestern Course Data API.

## Installation

Add it to your Gemfile:

    gem 'northwestern-api'

to install, run:

    $ bundle

Or install it directly with:

    $ gem install northwestern-api

## Usage

You'll have to set your client ID somewhere before using the gem.  If you're using Rails try the `config` directory and make an
initializer.

Initialize your key like so:

```
require 'northwestern-api'

Northwestern::API_KEY = "### YOUR_KEY_GOES_HERE ###"
```

Then you can use the API anywhere without making an instance of it. The
endpoints from the API are all available and named identically.  For `courses/details` and
`rooms/details` use `#course_details` and `#room_details` respectively.

To specify parameters, pass them as a Ruby hash (not including your API key,
it will get passed automatically) to each method.  The resulting JSON is also
parsed into Ruby Arrays and Hashes (the keys are not symbolized though, you'll
have to reference them using strings).

Here's how you might use the client to get all the EECS courses taught in Fall
2014 (assuming your key as been previously set):

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
Run now it's a very thin wrapper around the API and not much else.
