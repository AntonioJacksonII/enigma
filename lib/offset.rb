class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def square_date
    date.to_i * date.to_i
  end

  def create_offsets
    {
      A: square_date.to_s[-4].to_i,
      B: square_date.to_s[-3].to_i,
      C: square_date.to_s[-2].to_i,
      D: square_date.to_s[-1].to_i
    }
  end
end
