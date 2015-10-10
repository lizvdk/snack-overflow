class AddUsernamesToExistingUsers < ActiveRecord::Migration
  def up
    User.all.each do |user|
      if user.username.blank?
        user.username = /\A[^@]+/.match(user.email).to_s.downcase << user.id.to_s
        user.save
        puts "Username (#{user.username}) created for #{user.email}."
      end
    end
  end

  def down
    User.all.each do |user|
      if user.username.present?
        user.username = nil
        user.save
      end
    end
  end
end
