class Drink
  attr_reader :name, :type, :vol, :temp, :price

  def initialize(name, type, vol, temp, price)
    @name = name    # 商品名
    @type = type    # 容器 (1:缶, 2: ペットボトル, 3: 紙パック)
    @vol = vol      # 容量
    @temp = temp    # 温度 (1:つめた〜い, 2: あったか〜い)
    @price = price  # 値段
  end

  # コーラを生成
  def self.coke
    self.new('coke', 1, 500, 1, 120)
  end

  # レッドブルを生成
  def self.redbull
    self.new('redbull', 1, 250, 1, 200)
  end

  # 水を生成
  def self.water
    self.new('water', 2, 500, 1, 100)
  end

  # 綾鷹を生成
  def self.ayataka
    self.new('ayataka', 2, 500, 2, 140)
  end

  # BOSSを生成
  def self.boss
    self.new('boss', 1, 190, 1, 120)
  end

  # 午後の紅茶を生成
  def self.gogo_tea
    self.new('gogo_tea', 2, 500, 1, 140)
  end
end
