class MakeACocktail::Scraper

    def self.scrape_drinks
        @url = "https://www.liquor.com/classic-cocktails-4779424"

        website = Nokogiri::HTML(open(@url))
        drinks = []

        array_of_drinks = website.css("div.loc div.card-list__item")
        
        array_of_drinks.each_with_index do |drink, index|
            drink_name = drink.css("span.card__underline").text.strip
            drink_url = drink.css("a").attr("href").value
            drinks << {name: drink_name, url: drink_url}

            MakeACocktail::Drink.new(drink_name, drink_url)
            binding.pry
        end
        drinks
    end

    def self.scrape_url
        doc = Nokogiri::HTML(open(@url))

        links = website.css("div.loc div.card-list__item")
        
        links.each do |url|
            drink_url = drink.css("a").attr("href").value

            MakeACocktail::Drink.new(drink_name, drink_url)
            # binding.pry
        end
        drinks
    end

    def self.scrape_recipe(url)
        drink = {}
        drink_page = Nokogiri::HTML(open(drink_url))
        # binding.pry

    end


end
