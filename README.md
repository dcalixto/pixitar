# Pixitar

Pixitar is an avatar generation library written in Crystal. Generate random, male or female avatars.

Inspired by https://github.com/matveyco/8biticon (author of the original image assets).

## Installation

Add this to your application's `shard.yml`:

dependencies:
pixitar:
github: dcalixto/pixitar

Then run:

shards install

## Usage

require "pixitar"
require "pixitar/web"

Pixitar::Web.run

# Create a new avatar generator

avatar = Pixitar::Avatar.new

# Generate random avatar (male or female)

avatar.generate_avatar # Saves to auto-generated filename

# Generate male avatar with custom filename

avatar.generate_avatar(:male, "avatar.png") # Saves as avatar.png

# Generate male avatar

avatar.male_avatar # Saves to auto-generated filename

# Generate female avatar

avatar.female_avatar # Saves to auto-generated filename

Access avatars via HTTP:

GET /avatar/male - Generate male avatar
GET /avatar/female - Generate female avatar

Development

# Install dependencies

shards install

# Run specs

crystal spec

Copy

Execute

Contributing
Fork it (https://github.com/dcalixto/pixitar/fork)
Create your feature branch (git checkout -b my-new-feature)
Commit your changes (git commit -am 'Add some feature')
Push to the branch (git push origin my-new-feature)
Create a new Pull Request
Contributors
Your Name - creator and maintainer
License
This shard is available as open source under the terms of the MIT License.
