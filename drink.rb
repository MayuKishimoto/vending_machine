class Drink
  attr_reader :name, :type, :price

  def initialize(name, type, price)
    @name = name
    @type = type
    @price = price
  end

  # コーラを生成
  def self.coke
    self.new('coke', 1, 120)
  end

  # レッドブルを生成
  def self.redbull
    self.new('redbull', 1, 200)
  end

  # 水を生成
  def self.water
    self.new('water', 2, 100)
  end
end
