namespace :db do
  desc 'Fill database with sample data'
  task :populate, [:environment] do
    count = ENV['count'].to_i || 1000
    puts 'Resetting the database'
    Rake::Task['db:reset'].invoke
    Faker::Config.locale = I18n.locale || :ru
    puts "Creating #{count} #{Faker::Config.locale} phrases:"
    ActiveRecord::Base.transaction do
      count.times do
        text = Faker::Lorem.words(4..10).join(' ')
        Sentence.create!(text: text.capitalize)
      end
    end
    puts 'Creating Material icon names'
    ActiveRecord::Base.transaction do
      I18n.t('faker.icon.names').each do |icon_name|
        Icon.create!(name: icon_name)
      end
    end
    puts 'Populate completed.'
  end
end
