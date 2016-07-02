namespace :db do
  desc "Fill database with sample data"
  task :populate, [:environment] do
    count = ENV['count'].to_i || 1000
    puts 'Resetting the database'
    Rake::Task['db:reset'].invoke
    Faker::Config.locale = I18n.locale || :ru
    puts "Creating #{count} #{Faker::Config.locale} phrases:"
    ActiveRecord::Base.transaction do
      count.times do |n|
        text = Faker::Lorem.words(4..10).join(' ')
        Sentence.create!(text: text.capitalize)
      end
    end
    puts "Populate completed."
  end
end
