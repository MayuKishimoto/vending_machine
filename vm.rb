require_relative "drink"

class VendingMachine
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # ドリンクが取出し口に落ちる音
  FALLING_DRINK = ["ｶﾗﾝｺﾛﾝ", "ｶﾞｼｬﾝ", "ｺﾞﾄﾝ"].freeze

  def initialize
    # 最初に自動販売機に入っている投入金額は0円
    @slot_money = 0
    # 最初に自動販売機に入っているドリンクは0本(２次元配列を初期化)
    @stock_drink = Hash.new { |h, k| h[k] = {} }
    # 最初に自動販売機に入っている売上金額は0円
    @sale_amount = 0
    # コーラ５本を格納する。
    store(Drink.coke, 5)
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる。
    @slot_money += money
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    puts "現在の投入金額：#{@slot_money}円"
  end

  # 投入金額とストックを確認し、購入可能なドリンクのリストを取得する。
  def purchasable_list
    @stock_drink.each do |drink|
      drink_name = drink[0];
      if purchase_judge(drink_name)
        puts "#{drink_name}が買えます。"
      else
        puts "購入できるドリンクはありません。"
      end
    end
  end

  # 購入操作
  def purchase(drink_name)
    if purchase_judge(drink_name)
      # 購入したジュースの価格分、投入金額を減らし、
      @slot_money -= @stock_drink[drink_name]['price']
      # 売上金額を増やす。
      @sale_amount += @stock_drink[drink_name]['price']
      # ジュースの在庫を減らす。
      @stock_drink[drink_name]['stock'] -= 1
      # ジュースを取り出し口に落とす表現
      puts "#{FALLING_DRINK.shuffle.sample.rjust(26)}..."
      #puts "#{drink_name}"
      drink_shape(drink_name)
      # 残金表示
      current_slot_money
    else
      puts "購入できません。"
    end
  end

  # ドリンクの形状の表現
  def drink_shape(drink_name)
    case @stock_drink[drink_name]['type']
    # 1(=缶)の場合の表示
    when 1
      label = drink_name.center(18)
      puts " ------------------------"
      puts "|ミ                      |"
      puts "|   ==================、 |"
      puts "|  |                  |  |"
      puts "|  |#{label}|  |"
      puts "|   =================〃  |"
      puts " ------------------------"
    # 2(=ペットボトル)の場合の表示
    when 2
      label = drink_name.center(14)
      puts " ------------------------"
      puts "|ミ                      |"
      puts "|   =============、      |"
      puts "|  |              ---|   |"
      puts "|  |#{label}---|   |"
      puts "|   =============〃      |"
      puts " ------------------------"
    else
      puts "????"
    end
  end

  # 購入判定（true か falseを出力）
  def purchase_judge(drink_name)
    @slot_money >= @stock_drink[drink_name]['price'] &&
    @stock_drink[drink_name]['stock'] > 0
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する。
    puts "返却：#{@slot_money}円"
    # 自動販売機に入っているお金を0円に戻す。
    @slot_money = 0
  end

  # ドリンクを補充する。
  def store(drink, num)
    # 初めて呼び出された時(初めて格納する時)は0を入れる。
    if @stock_drink[drink.name]['stock'].nil?
      @stock_drink[drink.name]['stock'] = 0
    end
    num.times {
      @stock_drink[drink.name]['type'] = drink.type
      @stock_drink[drink.name]['price'] = drink.price
      @stock_drink[drink.name]['stock'] += 1
    }
    puts "#{drink.name}を#{num}本補充しました。"
  end

  # 格納されているジュースの情報（値段と名前と在庫）を取得できる。
  def current_stock_drink
    @stock_drink.each do |drink|
      puts "#{drink[0]} -> 種別: #{drink[1]['type']} 値段: #{drink[1]['price']}円 在庫: #{drink[1]['stock']}本"
    end
  end

  # 売上金額の総計を取得できる。
  def current_sale_amount
    puts "現在の売上金額：#{@sale_amount}円"
  end
end