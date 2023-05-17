module Display
  # メッセージ定型文
  RUNNING_MSG = "稼働中".freeze
  SUSPENDED_MSG = "休止中".freeze
  CANNOT_BUY_MSG = "購入不可".freeze

  # 擬音
  INSERT_BILL_SOUND = "ｳｨｰﾝ".freeze
  INSERT_COIN_SOUND = "ﾁｬﾘｰﾝ".freeze
  FALLING_CAN_SOUND = ["ｶﾗﾝｺﾛﾝ", "ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze
  FALLING_BOTTLE_SOUND = ["ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze
  FALLING_MONEY_SOUND = ["ｼﾞｬﾗｼﾞｬﾗ", "ﾁｬﾘｰﾝ"].freeze

  # メッセージ表示
  def display_message(msg)
    case msg
    when 1
      label = RUNNING_MSG.center(14)
    when 2
      label = CANNOT_BUY_MSG.center(14)
    else
      label = SUSPENDED_MSG.center(14)
    end

    puts
    puts " ------------------"
    puts "|#{label}|"
    puts " ------------------"
    puts
  end

  # 自販機の外観を表現
  ### 在庫がなにもないときに"稼働中"が"休止中"になるようにしたい。
  ### 棚番号に対応する飲み物の容量(缶コーヒー等)によって縦幅を半分にしたい。
  def display_machine_exterior
    puts
    puts " ====================="
    puts "|  _   _   _   _   _  |"
    puts "| | | | | | | | | | | |"
    puts "| | | | | | | | | | | |"
    puts "|  -   -   -   -   -  |"
    puts "| [1] [2] [3] [4] [5] |"
    puts "|=====================|"
    puts "|          ______  __ |"
    puts "|         |稼働中||==||"
    puts "|          ￣￣￣  ￣ |"
    puts "|  =============      |"
    puts "| |             | |￣||"
    puts "|  =============   ￣ |"
    puts " ====================="
    puts
  end

  # お金の投入処理の表現
  def display_insert_money(money)
    puts
    if money == 1000
      puts "                 "
      puts "================="
      puts "   __________  "
      puts "  |  ------  | #{INSERT_BILL_SOUND}..."
      puts "   -/      \\- "
      puts "   /        \\  "
    else
      puts "                 |"
      puts "================="
      puts "#{INSERT_COIN_SOUND.rjust(18)}..."
      puts "      ______     |"
      puts "     /      \\  /￣\\ 彡"
      puts "    /--------\\ \\__/ "
      puts "    \\--------/   |"
      puts "     \\      /    |"
      puts "      ￣￣￣     |"
    end
    puts
  end

  # 返金処理の表現
  def display_return_money(money)
    label = money.to_s.rjust(13)
    puts
    puts " ------------------"
    puts "| 返金額           |"
    puts "| #{label} 円 |"
    puts " ------------------"
    puts
    puts "#{FALLING_MONEY_SOUND.shuffle.sample.rjust(14)}..."
    puts " --------"
    puts "|   川   |"
    puts "|   ○    |"
    puts " \\ ○ ○  /"
    puts "   ----"
    puts
  end

  # 金額表示の表現
  def display_money(money)
    label = money.to_s.rjust(13)
    puts
    puts " ------------------"
    puts "| 投入金額         |"
    puts "| #{label} 円 |"
    puts " ------------------"
    puts
  end

  # 取り出し口に缶が落ちる表現
  def can_outlet(drink_name)
    label = drink_name.center(18)
    puts
    puts "#{FALLING_CAN_SOUND.shuffle.sample.rjust(26)}..."
    puts " -------------------------"
    puts "| ミ                      |"
    puts "|   ==================、  |"
    puts "|  |                  |   |"
    puts "|  |#{label}|   |"
    puts "|   =================〃   |"
    puts " -------------------------"
    puts
  end

  # 取り出し口にペットボトルが落ちる表現
  def bottle_outlet(drink_name)
    label = drink_name.center(14)
    puts
    puts "#{FALLING_BOTTLE_SOUND.shuffle.sample.rjust(26)}..."
    puts " -------------------------"
    puts "| ミ                      |"
    puts "|   =============、       |"
    puts "|  |              ---|    |"
    puts "|  |#{label}---|    |"
    puts "|   =============〃       |"
    puts " -------------------------"
    puts
  end
end
