# NutritionFacts
This gem can be used to find nutritional facts for a large variety of food items including brand names, specific restaurant items, and grocery foods.

Example searches:
  - mcdonalds french fries
  - chipotle burrito
  - almonds
  - blueberry pie
  - corned beef on rye
  - pecan crusted rainbow trout

The data is pulled from the [Nutritionix API](https://developer.nutritionix.com/).

An accompanying blog post about building this gem: [https://preiser.io/Nutrition-Facts-CLI.html](https://preiser.io/Nutrition-Facts-CLI.html)

## Installation
Add this line to your application's Gemfile:

```
$ gem install nutrition_facts
```

## Usage
Type `nutrition-facts` in your Terminal window and press enter.

Follow the on-screen prompts.

## Development
After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at [https://github.com/preiser/nutrition_facts](https://github.com/preiser/nutrition_facts).

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
