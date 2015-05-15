class RemoveVotesForOwnQuestion < ActiveRecord::Migration
  def change
    Vote.reset_column_information
    Vote.all.each do |vote|
      if vote.user == vote.votable.user
        puts "destroying vote #{vote.id} by #{vote.user.email} for #{vote.votable.title}"
        vote.destroy!
      end
    end
  end
end
