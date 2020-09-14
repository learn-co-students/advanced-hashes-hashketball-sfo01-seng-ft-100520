require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team|
    team.each do |team_info, details|
      if team_info == :players
        details.each do |stats|
          if stats[:player_name] == player_name
          return stats[:points]
          end
        end   
        end   
      end   
  end
end

def shoe_size(player_name)
  game_hash.each do |location,team|
    team.each do |team_info, details|
      if team_info == :players
        details.each do |stats|
          if stats[:player_name] == player_name
            return stats[:shoe]
          end
        end   
      end  
    end   
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    team.each do |team_info, details|
        if details == team_name
          return team[:colors]
        end   
    end  
  end  
end

def team_names
teams = []
  game_hash.each do |location, team|
    team.each do |team_info, details|
      if team_info == :team_name
        teams << team[:team_name]
      end
    end 
  end
  teams
end

def player_numbers (team_name)
jersey_numbers = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name 
      team.each do |team_info, details|
        if team_info == :players
          details.each do |stats|
                jersey_numbers << stats[:number]
          end 
        end
      end
    end
  end   
  jersey_numbers
end

def player_stats (player_name)
  game_hash.each do |location, team|
    team.each do |team_info, details|
      if team_info == :players
        details.each do |stats|
            if stats[:player_name] == player_name
              return stats
            end
          end   
        end 
    end   
  end  
end   


def big_shoe_rebounds
  largest_shoe = nil
  rebounds = nil
  game_hash.each do |location, team|
    team.each do |team_info, details|
       
      if team_info == :players
        details.each do |stats|
          
          if largest_shoe == nil || largest_shoe < stats[:shoe]
            largest_shoe = stats[:shoe]
            rebounds = stats[:rebounds]
          end 
        end  
      end 
    end 
  end
  rebounds
end

def most_points_scored
points = nil
mvp = nil
  game_hash.each do |location, team|
    team.each do |team_info, details|
      if team_info == :players
        details.each do |stats|
          
          if points == nil || points < stats[:points]
            points = stats[:points]
            mvp = stats[:player_name]
          end
        end 
      end 
    end
  end
  mvp
end

def winning_team
  home_array = []
  away_array = []
  home_points = nil
  away_points = nil
  
 game_hash.each do |location, team|
    if location == :home
      team.each do |team_info, details|
        if team_info == :players
          details.each do |stats|
            home_array << stats[:points]
            home_points = home_array.reduce (0) {|total, num| total + num}
          end   
        end   
      end
    elsif location == :away
       team.each do |team_info, details|
        if team_info == :players
          details.each do |stats|
            away_array << stats[:points]
            away_points = away_array.reduce (0) {|total, num| total + num}
          end
        end
      end 
    end
  end
   if home_points > away_points
    return "Home Wins!"
    elsif home_points < away_points
    return "Away Wins!"
    end
 
 end 
 
 def player_with_longest_name
   longest_name = nil
   game_hash.each do |location, team|
    team.each do |team_info, details|
      if team_info == :players
        details.each do |stats|
          if longest_name == nil || longest_name.length < stats[:player_name].length 
            longest_name = stats[:player_name]
          end
        end 
      end
    end
   end
   longest_name
 end

 def long_name_steals_a_ton? (player_with_longest_name)
  steals = nil 
  steals_array = []
    game_hash.each do |location, team|
    team.each do |team_info, details|
      if team_info == :players
       
        details.each do |stats|
         
           if stats[:player_name] == player_with_longest_name
            steals = stats[:steals]
          end 
          
          steals_array << stats[:steals]
      end
      end
    end
    end
  steals_array.max == steals
 end 
 
 
 