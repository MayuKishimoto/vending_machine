module Display
  # ドリンクが取出し口に落ちる音
  FALLING_CAN = ["ｶﾗﾝｺﾛﾝ", "ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze
  FALLING_BOTTLE = ["ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze

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