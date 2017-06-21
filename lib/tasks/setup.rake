namespace :setup do
  desc "Reset and Reload the DB"
  task :reset do
    [:drop, :create, :migrate].each do |step|
      puts "#{step.to_s.capitalize} the DB"
      Rake::Task["db:#{step}"].invoke
    end
#    Rake::Task["db:seed"].invoke
  end

  task :seed do
    Rake::Task["db:seed"].invoke
  end
end