# Pixitar

![Pixitar Avatar Example](./src/avatars.png)

Pixitar is an avatar generator library written in Crystal. It allows for the generation of random avatars, as well as custom male or female avatars.

![Crystal Test](https://github.com/dcalixto/pixitar/actions/workflows/crystal-test.yml/badge.svg?branch=master)

Inspired by [8biticon](https://github.com/matveyco/8biticon) _(author of the original image assets)_

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  pixitar:
    github: dcalixto/pixitar
```

Then run the following command to install the dependencies:

```crystal
shards install
```

## Usage

Import the library

```crystal
require "pixitar"
```

Create an avatar generator

```crystal
avatar = Pixitar::Avatar.new
```

Generate a random avatar (male or female)

To generate a random avatar:

```crystal
   avatar = Pixitar::Avatar.new.generate_avatar
```

**_*This will generate a random male or female avatar and save it with an auto-generated filename (e.g., avatar_xfal_2741.png).*_**

Generate male avatar with custom filename
To generate a male avatar and save it to a specific filename:

```crystal
 avatar = Pixitar::Avatar.new.generate_avatar(:male, "avatar.png") # Saves as avatar.png
```

Generate a female avatar with a custom filename
To generate a female avatar and save it to a specific filename:

```crystal
 avatar = Pixitar::Avatar.new.generate_avatar(:female, "avatar_female.png") # Saves as avatar_female.png

```

Generate male or female avatars directly
To generate male or female avatars directly:

```crystal
avatar.male_avatar # Generates and saves a male avatar to an auto-generated filename
```

```crystal
avatar.female_avatar # Generates and saves a female avatar to an auto-generated filename
```

Web Server Usage
To serve avatars via a web server:

Import the necessary libraries:

```crystal
require "pixitar"
require "pixitar/web"



```

Run the web server:

```crystal


Pixitar::Web.run

```

Access avatars via HTTP:
You can generate and download avatars by making HTTP requests:

```crystal
GET /avatar/male - Generate a male avatar
GET /avatar/female - Generate a female avatar

```

Example Web Server

```crystal
require "pixitar"
require "pixitar/web"

Pixitar::Web.run
```

## Development

To work on Pixitar locally, follow these steps:
Install dependencies

```crystal
shards install

```

Run tests

```crystal
crystal spec

```

Contributing

1. Fork it (https://github.com/dcalixto/pixitar/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

Daniel Calixto - creator and maintainer

## License

This shard is available as open source under the terms of the MIT License.
