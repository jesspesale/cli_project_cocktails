class MakeACocktail::CLI

    def start
        puts "\nWelcome, let's make a drink!" 
        get_drinks
        list_drinks
        get_users_drink
    end

    def get_drinks
        @drinks = MakeACocktail::Drink.all
    end
    
    def list_drinks
        puts "\nHere is the list of drinks to choose from:"
        @drinks.each_with_index do |drink, index| 
            # next if index == 4
            # next if index + 1 == 4 && drink.name == "11 Martini Variations to Try Right Now" 
            # && drink.name == "Famous Cocktails That Have Evolved Over Time"
            if index == 4 && index == 13 && index == 16 
                nil
            else
                puts "#{index + 1}. #{drink.name}" 
            end
        end
    end
    
    def get_users_drink
         puts "\nScroll up to view the list of drinks"
        puts "\nPlease enter the number of the drink you would like to make."
        @chosen_drink = gets.strip.to_i
        if valid_input(@chosen_drink)
            get_drink_url(@chosen_drink)
            show_drink_info_for(@drink_url) 
            another_drink
        else
            wrong_input
            get_users_drink
        end
    end
    
    def get_drink_url(drink_number)
        @drink_url = @drinks[drink_number - 1].url
        @drink_name = @drinks[drink_number - 1].name
        puts "\nHere are the ingredients for a #{@drink_name}:"
    end

    def show_drink_info_for(drink_url)
        @ingredients = MakeACocktail::Scraper.scrape_ingredients(@drink_url)

       @ingredients.each do |x|
            if x.include? "Garnish:"
                puts "Garnish with#{x.gsub("Garnish:", "")}"
                # puts "Garnish with#{x.delete("Garnish:")}"
            else
                puts "#{x}" unless x.include? "Garnish:"
            end
        end
    end

    def wrong_input
        puts "\nSorry please pick a number corresponding to the drinks or press 0 to view the list of drinks again."
        input = gets.strip.to_i
        if input == 0 
            list_drinks
            get_users_drink
        elsif valid_input(input)
            show_drink_info_for(input)
        else
            wrong_input
        end
    end
    
    def valid_input(input)
        input <= @drinks.length && input > 0 
    end

    def another_drink
        puts "\nWould you like to make another drink? Enter y or n"
        input = gets.strip
        if input == "y"
            puts "\nOkay, here is the list of drinks to choose from"
            list_drinks
            get_users_drink
        elsif input == "n"
            puts "Enjoy your drink!"
        else
            puts "\nPlease try again."
            another_drink
        end
    end

end