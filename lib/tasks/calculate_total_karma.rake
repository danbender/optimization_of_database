namespace :db do
  desc 'creates total karma field in users table'
  task :calc_total_karma => :environment do

    def calculate_total_karma(user)
      total_karma = 0

      user.karma_points.each do |karma|
        total_karma += karma.value
      end
      total_karma
    end

    User.all.each do |user|
      user.update_attribute(:total_karma, calculate_total_karma(user))
      p "User #{user.id} updated"
    end
  end
end