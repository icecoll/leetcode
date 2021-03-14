class MyHashMap
  def initialize
    @hash = {}
  end

  def put(key, value)
    @hash[key] = value
    nil
  end

  def get(key)
    @hash[key] || -1
  end

  def remove(key)
    @hash[key] = nil
  end
end
