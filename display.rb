module Display
  # ドリンクが取出し口に落ちる音
  FALLING_CAN = ["ｶﾗﾝｺﾛﾝ", "ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze
  FALLING_BOTTLE = ["ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze

  # 金額表示の表現
  def display_current_money(money)
    label = money.to_s.rjust(12)
    puts " -----------------"
    puts "| 投入金額        |"
    puts "| #{label} 円 |"
    puts " -----------------"
  end

  # 取り出し口に缶が落ちる表現
  def can_outlet(drink_name)
    label = drink_name.center(18)
    puts "#{FALLING_CAN.shuffle.sample.rjust(26)}..."
    puts " -------------------------"
    puts "| ミ                      |"
    puts "|   ==================、  |"
    puts "|  |                  |   |"
    puts "|  |#{label}|   |"
    puts "|   =================〃   |"
    puts " -------------------------"
  end

  # 取り出し口にペットボトルが落ちる表現
  def bottle_outlet(drink_name)
    label = drink_name.center(14)
    puts "#{FALLING_BOTTLE.shuffle.sample.rjust(26)}..."
    puts " -------------------------"
    puts "| ミ                      |"
    puts "|   =============、       |"
    puts "|  |              ---|    |"
    puts "|  |#{label}---|    |"
    puts "|   =============〃       |"
    puts " -------------------------"
  end
end