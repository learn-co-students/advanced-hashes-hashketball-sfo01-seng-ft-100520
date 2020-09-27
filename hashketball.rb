require "pry"

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
          slam_dunks: 1,
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
          slam_dunks: 7,
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
          slam_dunks: 15,
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
          slam_dunks: 5,
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
          slam_dunks: 1,
        },
      ],
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
          slam_dunks: 2,
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
          slam_dunks: 10,
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
          slam_dunks: 5,
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
          slam_dunks: 0,
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
          slam_dunks: 12,
        },
      ],
    },
  }
end

def num_points_scored(player_name)
  count = 0
  while count < game_hash.keys.length
    key = game_hash.keys[count]
    value = game_hash[key]
    count1 = 0
    while count1 < value[:players].length
      player = value[:players][count1]
      if player[:player_name] == player_name
        return player[:points]
      end
      count1 += 1
    end
    count += 1
  end
end

def shoe_size(player_name)
  count = 0
  while count < game_hash.keys.length
    key = game_hash.keys[count]
    value = game_hash[key]
    count1 = 0
    while count1 < value[:players].length
      player = value[:players][count1]
      if player[:player_name] == player_name
        return player[:shoe]
      end
      count1 += 1
    end
    count += 1
  end
end

def team_colors(team_name)
  # count = 0
  # while count < game_hash.values.length
  #   team = game_hash.values[count]
  #   if team[:team_name] == team_name
  #     return team[:colors]
  #   end
  #   count += 1
  # end
  var1 = game_hash.find do |key, team|
    team[:team_name] == team_name
  end
  return var1[1][:colors]
end

def team_names
  game_hash.values.map do |team|
    team[:team_name]
  end
  #  count = 0
  #  team_names = []
  #  while count < game_hash.values.length do
  # team = game_hash.values[count]
  # team_names.push(team[:team_name])
  #    count += 1
  #     end
  #     return team_names
end

def player_numbers(team_name)
  team = game_hash.find do |key, value|
    value[:team_name] == team_name
  end
  players = team[1][:players]
  players.map do |player|
    player[:number]
  end
end

def player_stats(player_name)
  count = 0
  while count < game_hash.values.length
    team = game_hash.values[count]
    count1 = 0
    while count1 < team[:players].length
      player = team[:players][count1]
      if player[:player_name] == player_name
        return player
      end
      count1 += 1
    end
    count += 1
  end
end

def get_player_with_biggest_shoe_size
  count = 0
  biggest_shoe_size = 0
  player1 = nil
  while count < game_hash.values.length
    team = game_hash.values[count]
    count1 = 0
    while count1 < team[:players].length
      player = team[:players][count1]
      if player[:shoe] > biggest_shoe_size
        biggest_shoe_size = player[:shoe]
        player1 = player
      end
      count1 += 1
      end
    count += 1
  end
  return player1
end

def big_shoe_rebounds
  player = get_player_with_biggest_shoe_size()
  player[:rebounds]
end
