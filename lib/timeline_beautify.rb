class TimelineBeautify
	def self.beauty_time(timestamp)
	    seconds_ago = Time.now.to_i - Time.at(timestamp.to_i).to_i
		minutes_ago = seconds_ago / 60
		hours_ago = minutes_ago / 60
		days_ago = hours_ago / 24
		weeks_ago = days_ago / 7
			if minutes_ago < 1
				return "#{seconds_ago} seconds ago"
			elsif hours_ago < 1
				return "#{minutes_ago} minutes ago"
			elsif days_ago < 1
				return "#{hours_ago} hours ago"
			elsif weeks_ago < 1
				return "#{days_ago} days ago"
			else
				return "#{weeks_ago} weeks ago"
			end
	end
end