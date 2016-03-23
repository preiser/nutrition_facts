class NutritionFacts::CLI

  def call
    @food_data = nil
    start
  end

  def welcome
    system 'clear'
    puts "--------- Welcome to NutritionFacts CLI ---------"
    puts ""
  end

  def start
    food_search
  end

  def food_search
    welcome
    puts "Please type the name of a food to search:"

    user_food_item = gets.chomp
    get_food_data(user_food_item)
    display_item_data
  end

  def get_food_data(name)
    @food_data = NutritionFacts::Item.find_by_name(name)
  end

  def display_item_data
    puts ""
    puts "#{@food_data.item_name}"
    puts "---"
    puts "Calories: #{@food_data.nf_calories}"
    puts "Total Fat: #{@food_data.nf_total_fat}"
    puts "Protein: #{@food_data.nf_protein}"
    puts "Dietary Fiber: #{@food_data.nf_dietary_fiber}"
    puts "Sugar: #{@food_data.nf_sugars}"
    loop_or_quit
  end

  def loop_or_quit
    puts ""
    puts 'Please type "new search" or "exit".'
    choice = gets.chomp.downcase

    case choice
    when 'back'
      current_or_forecast
    when 'new search'
      start
    when 'exit'
      puts 'Goodbye'
    else
      puts 'Invalid input. Please try again.'
      loop_or_quit
    end
  end

  # def start
  #   list
  #   input = nil
  #   while input != 'exit'
  #     puts 'Enter the name of a food to see its nutrition facts:'
  #     input = gets.strip.downcase
  #
  #     if input.to_i > 0
  #       item = @items[input.to_i - 1]
  #       puts "#{item.name} - #{item.calories}"
  #     elsif 'list'
  #       @items
  #     else
  #       puts 'not sure what you mean, type in a food' unless input == 'exit'
  #     end
  #
  #   end
  # end

  # def list
  #   puts ''
  #   puts 'Welcome to NutritionFacts CLI'
  #   puts ''
  #   @items = NutritionFacts::Item.list_items
  #   @items.each.with_index(1) do |item, index|
  #     puts "#{index}. - #{item.name}"
  #   end
  # end
end
