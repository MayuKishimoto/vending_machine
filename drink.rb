class Drink
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # コーラを生成
  def self.coke
    self.new('coke', 120)
  end

  # レッドブルを生成
  def self.redbull
    self.new('redbull', 200)
  end

  # 水を生成
  def self.water
    self.new('water', 100)
  end
end
