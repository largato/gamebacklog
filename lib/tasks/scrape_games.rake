require 'nokogiri'

namespace :scrape do
  desc 'Scrape games for each platform from thegamesdb.net'
  task games: :environment do
    Rails.logger.info('Starting scrapping of games')
    Platform.all.each do |plat|
      if plat.thegamesdb_id.present?
        Rails.logger.info("Scrapping for #{plat.name}...")
        url = URI.parse("http://thegamesdb.net/api/GetPlatformGames.php?platform=#{plat.thegamesdb_id}")
        content = open(url)

        doc = Nokogiri::XML(content)

        doc.xpath('//Game').each do |game|
          thegamesdb_id = game.xpath('id').text.to_i
          name = game.xpath('GameTitle').text
          releaseDate = game.xpath('ReleaseDate').text

          g = Game.find_or_initialize_by(thegamesdb_id: thegamesdb_id)

          g.name = name
          g.platform = plat
          unless releaseDate.blank?
            if releaseDate.count('/') > 0
              g.release_date = Date.strptime(releaseDate, "%m/%d/%Y")
            else
              g.release_date = Date.strptime("1/1/#{releaseDate}", "%m/%d/%Y")
            end
          end
          g.save!
        end
      end
    end
    Rails.logger.info("Scrapping of games endend")
  end
end
