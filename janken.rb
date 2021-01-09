class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
      player_hand = gets.chomp
      while true
        if player_hand == "0" || player_hand == "1" || player_hand == "2"
          return player_hand.to_i
        else
          puts "もう一度数字を入力してください"
          puts "0:グー, 1:チョキ, 2:パー"
          player_hand = gets.chomp
        end
      end
  end
end
class Enemy
  def hand
    enemy_hand = rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    jankens = ["グー","チョキ","パー"]
    result = (player_hand - enemy_hand + 3)%3
    if result == 0
      puts "相手の手:#{jankens[enemy_hand]}あいこです"
      return true
    elsif player_hand > 2 || player_hand < 0
      puts "正しい数字を入力して下さい。"
      return next_game = true
    elsif result == 2
    puts "相手の手:#{jankens[enemy_hand]}あなたの勝ちです"
      return false
    else
      puts "相手の手:#{jankens[enemy_hand]}あなたの負けです"
      return false
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
end
