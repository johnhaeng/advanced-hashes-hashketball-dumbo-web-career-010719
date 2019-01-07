require "pry"

def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    
    
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def players_by_number(number)
  game_hash.each do |location, datas|
    datas[:players].each do |name, stats|
      if stats[:number] == number
        binding.pry
        return name
      end
    end
  end
end

puts players_by_number(33)

def num_points_scored(name)
  game_hash.each do |location, datas|
    datas[:players].each do |player, stats|
      if player == name
        return stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, datas|
    datas[:players].each do |player, stats|
      if player == name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, data|
    if data[:team_name] == name
      return data[:colors]
    end
  end
end

def team_names
  team_arr = []

  game_hash.each do |location, data|
    team_arr.push(data[:team_name])
  end

  team_arr
end

def player_numbers(name)
  jersey_array = []

  game_hash.each do |locatoin, data|
    if name == data[:team_name]
      data[:players].each do |player, stats|
        jersey_array.push(stats[:number])
      end
    end 
  end

  jersey_array.sort
end

# def player_stats(name)
#   new_hash = game_hash
#   new_hash.each do |location, data|
#     data.each do |components, stats|
#       if stats.include?(name)
#       return new_hash[location][components][name]
#       end
#     end
#   end
# end

# why do I have to go through each nested hash here?
def player_stats(name)
  stats_hash = {}
  
  game_hash.each do |location, data|
    game_hash[location].each do |nested_key, nested_value|
      if nested_key == :players
        game_hash[loaction][:players].each do |player, stats|
          if name == player
            stats_hash = game_hash[location][:players][name]
          end
        end
      end
    end
  end
  stats_hash
end

player_stats('Brooke Lopez')




def big_shoe_rebounds
  max_shoe = nil
  max_player = ''
  max_player_rebound = ''

  game_hash.each do |location, data|
    data[:players].each do |names, stats|
      if max_shoe == nil || stats[:shoe] > max_shoe
        max_shoe = stats[:shoe]
        max_player = names
      end

      if max_player == names 
        max_player_rebound = stats[:rebounds]
      end
    end 
  end

  max_player_rebound
end



def most_points_scored
  most_points = nil
  most_points_player = ''

  game_hash.each do |location, data|
    data[:players].each do |names, stats|
      if most_points == nil || stats[:points] > most_points
        most_points = stats[:points]
        most_points_player = names
      end
    end
  end

  most_points_player
end


def winning_team
  points_home = 0
  points_away = 0 

  game_hash.each do |location, data|
    if location == :home
      data[:players].each do |names, stats|
        points_home += stats[:points]
      end 

      puts points_home
    else
      data[:players].each do |names, stats|
        points_away += stats[:points]
      end

      puts points_away
    end
  end

  if points_home > points_away
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

winning_team




