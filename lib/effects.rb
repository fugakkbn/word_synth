module Effects
  ALPHABETS = ('a'..'z').to_a.freeze
  MAX_INDEX = 25

  def self.reverse
    ->(words) do
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    ->(words) do
      words.each_char.map { |c| c == ' ' ? c : c * rate }.join
    end
  end

  def self.loud(level)
    ->(words) do
      words.split(' ').map { |w| w.upcase + '!' * level }.join(' ')
    end
  end

  def self.pitch_shift(shift_number)
    ->(words) do
      words.each_char.map { |c|
        next c unless ALPHABETS.include?(c.downcase)

        current_index = ALPHABETS.index(c.downcase)
        shifted_index = current_index + shift_number
        shifted_index = (shifted_index % MAX_INDEX) - 1 if shifted_index > MAX_INDEX

        c.match?(/[A-Z]/) ? ALPHABETS[shifted_index].upcase : ALPHABETS[shifted_index]
      }.join
    end
  end
end
