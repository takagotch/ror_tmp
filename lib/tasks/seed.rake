
namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern
      task_name => :environment do
        load(filename) if File.exists?(filename)
      end
    end
  end
end

