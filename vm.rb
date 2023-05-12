require_relative "drink"

class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # ステップ２  ジュースの管理
  # ステップ３ 　購入
  # ステップ４　機能拡張
  # ステップ５　釣り銭と売り上げ管理

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  # （自動販売機に補充されたドリンクをインスタンス変数の @stock_drink に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    # 最初の自動販売機に入っているドリンクは0本(２次元配列を初期化)
    @stock_drink = Hash.new { |h, k| h[k] = {} }
    @sale_amount = 0
    # コーラ５本を実体化して格納
    store(Drink.coke, 5)
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  # ドリンクを補充する
  def store(drink, num)
    # 初めて呼び出された時(初めて格納する時)は0を入れる
    if @stock_drink[drink.name]['stock'].nil?
      @stock_drink[drink.name]['stock'] = 0
    end

    num.times {
      @stock_drink[drink.name]['price'] = drink.price
      @stock_drink[drink.name]['stock'] += 1
    }
  end

  # 格納されているジュースの情報（値段と名前と在庫）を取得できる。
  def current_stock_drink
    @stock_drink.each do |drink|
      puts "#{drink[0]} -> 値段: #{drink[1]['price']}円 在庫: #{drink[1]['stock']}本"
    end
  end

  # 購入判定（true か falseを出力）
  def purchase_judge(drink_name)
      current_slot_money >= @stock_drink[drink_name]['price'] &&
      @stock_drink[drink_name]['stock'] > 0
  end

  # 購入操作
  def purchase(drink_name)
    if purchase_judge(drink_name)
      # ジュースの在庫を減らし、
      @stock_drink[drink_name]['stock'] -= 1
      # 売り上げ金額を増やす。
      @sale_amount += current_stock_drink[drink_name]['price']
      @slot_money -= current_stock_drink[drink_name]['price']
      puts "釣り銭：#{@slot_money}円"
      # display_change(drink_name)
    end
  end

  # def display_change(drink_name)
  #   puts @change = @slot_money - @stock_drink[drink_name]['price']
  # end

  # 売上金額の取得
  def current_sale_amount
    puts @sale_amount
  end

  # 購入可能なドリンクのリストを取得
  def purchasable_list
    @stock_drink.each do |drink|
      drink_name = drink[0];
      if purchase_judge(drink_name)
          puts "#{drink_name}が買えます"
      end
    end
  end
end