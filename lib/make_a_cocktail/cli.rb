class MakeACocktail::CLI

    def start
        puts "\nWelcome, let's make a drink!" 
        get_drinks
        list_drinks
        get_users_drink
        #  MakeACocktail::Scraper.scrape_drinks
        # binding.pry
    end

    def get_drinks
        # to be scraped
        @drinks = [ "LIT", "Baybreeze", "Vodka Soda"]
    end

    def list_drinks
        puts "\nHere is the list of drinks to choose from:"
        @drinks.each_with_index do |drink, index| 
        puts "#{index + 1}. #{drink}" 
        end
    end

    def get_users_drink
        chosen_drink = gets.strip
        binding.pry
        # if valid_input(chosen_drink.to_i)

        # end
    end

    def valid_input(input)
        input <= @drinks.length && input > 0
    end


end