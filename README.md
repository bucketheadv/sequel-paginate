# Sequel::Paginate

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/sequel/paginate`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sequel-paginate', github: 'sven199109/sequel-paginate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequel-paginate

## Usage

Use `paginate @models` in your views, also you can use these options below.

* middle (default 3) 
* left (default 3)
* right (default 3)
* class (default 'paginate') css class name.
* remote (default false) Use it in ajax.If you want to use it, ensure include `jquery.js` and `jquery-ujs.js` in your layout file.

 For example, `paginate @models, left: 5, right: 5, remote: true`.

Whatever rails or padrino you use, your can use `ModelName.page(page_no)` to query models the page you want.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sequel-paginate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

