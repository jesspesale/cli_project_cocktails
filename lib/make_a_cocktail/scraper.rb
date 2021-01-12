class MakeACocktail::Scraper

    def self.scrape_drinks
        url = "https://www.liquor.com/classic-cocktails-4779424"

        website = Nokogiri::HTML(open(url))
        
        array_of_drinks = website.css("div.loc div.card-list__item")
        
        array_of_drinks.each do |drink|
            drink_name = drink.css("span.card__underline").text
            binding.pry

            
        end

    end

    def self.scrape_recipe(drink)
        drink = {}
        drink_page = Nokogiri::HTML(open())

    end


end





# puts section.count	= 38 (which is what we want)^

# section.each do |drink|
#   puts drink.css("span.card__underline")
# end
#  = all the drink names