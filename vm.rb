class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # ステップ２

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  # （自動販売機に補充されたドリンクをインスタンス変数の @stock_drink に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    # 最初の自動販売機に入っているドリンクは0本(２次元配列を初期化)
    @stock_id = 1
    @stock_drink = Hash.new { |h,k| h[k] = {} }
    @sale_amount = 0
    # コーラ５本を実体化して格納
    5.times { store(Drink.coke) }
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
  def store(drink)
    # 初めて呼び出された時(初めて格納する時)は0を入れる
    if @stock_drink[drink.name]["stock"].nil? 
      @stock_drink[drink.name]["stock"] = 0
    end
    @stock_drink[drink.name]["price"] = drink.price
    @stock_drink[drink.name]["stock"] += 1
    @stock_id += 1
  end

  # 格納されているジュースの情報（値段と名前と在庫）を取得できる。
  def current_stock_drink
    @stock_drink.each.with_index(0) { |drink,i| puts "#{i}: #{drink}" }
  end

  # 購入判定（true か falseを出力）
  def purchase_judge
    current_slot_money > @stock_drink["coke"]["price"]
  end

  # 購入操作
  def purchase
    puts purchase_judge
    if purchase_judge
      puts "買えてます！"
      # 買える
      # ジュースの在庫を減らし、
      @stock_drink["coke"]["stock"] -= 1
      # 売り上げ金額を増やす。
      @sale_amount += current_stock_drink["coke"]["price"]
      # 買えません（購入操作を行っても何もしない。）
    end
  end

  # 補充されたドリンクの本数
  #def stock_drink(num)
  #  @stock_drink += num
  #end

end

class Drink
  attr_reader :name, :price

  def initialize (name, price)
    @name = name
    @price = price
  end

  # コーラを生成
  def self.coke
    self.new("coke", 120)
  end

  # レッドブルを生成
  def self.redbull
    self.new("redbull", 200)
  end

  # 水を生成
  def self.water
    self.new("water", 100)
  end

end

