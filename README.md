# Infogram::Ruby

Ruby library for Infogr.am

## Installation

    $ gem install infogram

## Usage
```ruby
require 'infogram'

client = Infogram.new('API_KEY', 'API_SECRET')
infogram.themes.list
```

## Example response
```json
[
  {
    "id": 61,
    "title": "twitter",
    "thumb": "https://infogr.am/i/templates/61/twitter-thumbnail-small.png"
  },
  {
    "id": 44,
    "title": "Megaphone",
    "thumb": "https://infogr.am/i/templates/S/PRO-megaphone.png"
  },
  {
    "id": 34,
    "title": "Asketic-new",
    "thumb": "https://infogr.am/i/templates/S/asketic-black.png"
  }
]
```

## API Methods

### Themes
  `client.themes.list`

### Infograraphics
  `client.infographics.list`
  `client.infographics.get(infographic_id)`
  `client.infographics.create(params)`
  `client.infographics.update(infographic_id, params)`
  `client.infographics.destroy(infographic_id)`

### Users
  `client.users.list.get_infographics(user_id)`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/infogram-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
