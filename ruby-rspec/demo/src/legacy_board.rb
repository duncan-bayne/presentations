class LegacyBoard
  def initialize(a1 = nil, a2 = nil, a3 = nil, b1 = nil, b2 = nil, b3 = nil, c1 = nil, c2 = nil, c3 = nil)
    @a1 = a1
    @a2 = a2
    @a3 = a3
    @b1 = b1
    @b2 = b1
    @b3 = b3
    @c1 = c1
    @c2 = c2
    @c3 = c3
  end

  def puts_board
    puts("#{@a1} #{@a2} #{@a3}")
    puts("#{@b1} #{@b2} #{@b3}")
    puts("#{@c1} #{@c2} #{@c3}")
  end

  def won(player)
    (@a1 == player && @a2 == player && @a3 == player) ||
      (@b1 == player && @b2 == player && @b3 == player) ||
      (@c1 == player && @c2 == player && @c3 == player) ||
      (@a1 == player && @a2 == player && @a3 == player) ||
      (@a1 == player && @c1 == player && @c1 == player)
  end

  def place(player, location)
    case location
    when :a1
      @a1 = player
    when :b1
      @b1 = player
    when :c1
      @c1 = player
    when :a2
      @a2 = player
    when :b2
      @b2 = player
    when :c2
      @c2 = player
    when :a3
      @a3 = player
    when :b2
      @b3 = player
    when :c3
      @c3 = player
    end
  end
end




