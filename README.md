# Pixitar

![Pixitar Avatar Example](./src/avatars.png)
Pixitar is an avatar generation library written in Crystal. Generate random, male or female avatars.

Inspired by [8biticon](https://github.com/matveyco/8biticon) _(author of the original image assets)_

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  pixitar:
    github: dcalixto/pixitar
```

```crystal
shards install
```

## Usage

```crystal
require "pixitar"
```

Create a new avatar generator

```crystal
avatar = Pixitar::Avatar.new
```

Generate random avatar (male or female)

```crystal
avatar.generate_avatar # Saves to auto-generated filename
```

Generate male avatar with custom filename

```crystal
avatar.generate_avatar(:male, "avatar.png") # Saves as avatar.png
```

Generate male avatar

```crystal
avatar.male_avatar # Saves to auto-generated filename
```

Generate female avatar

```crystal
avatar.female_avatar # Saves to auto-generated filename
```

Web Server Usage

```crystal
require "pixitar"
require "pixitar/web"

Pixitar::Web.run

```

Access avatars via HTTP:

```crystal
`GET /avatar/male` - Generate male avatar
`GET /avatar/female` - Generate female avatar

```

## Development

Install dependencies

```crystal
shards install

```

Run specs

```crystal
crystal spec

```

Contributing

```crystal
1. Fork it (https://github.com/dcalixto/pixitar/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


```

## Contributors

```crystal
 Daniel Calixto - creator and maintainer

```

## License

This shard is available as open source under the terms of the MIT License.
