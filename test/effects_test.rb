require 'minitest/autorun'
require_relative '../lib/effects'

class EffectTest < Minitest::Test
  def test_reverse
    effect = Effects.reverse
    assert_equal 'ybuR si !nuf', effect.call('Ruby is fun!')
  end

  def test_echo
    effect = Effects.echo(2)
    assert_equal 'RRuubbyy iiss ffuunn!!', effect.call('Ruby is fun!')

    effect = Effects.echo(3)
    assert_equal 'RRRuuubbbyyy iiisss fffuuunnn!!!', effect.call('Ruby is fun!')
  end

  def test_loud
    effect = Effects.loud(2)
    assert_equal 'RUBY!! IS!! FUN!!!', effect.call('Ruby is fun!')

    effect = Effects.loud(3)
    assert_equal 'RUBY!!! IS!!! FUN!!!!', effect.call('Ruby is fun!')
  end

  def test_pitch_shift
    effect = Effects.pitch_shift(0)
    assert_equal 'ABC abc 123!', effect.call('ABC abc 123!')

    effect = Effects.pitch_shift(1)
    assert_equal 'BCD bcd 123!', effect.call('ABC abc 123!')

    effect = Effects.pitch_shift(2)
    assert_equal 'CDE cde 123!', effect.call('ABC abc 123!')

    effect = Effects.pitch_shift(-1)
    assert_equal 'ZAB zab 123!', effect.call('ABC abc 123!')

    effect = Effects.pitch_shift(25)
    assert_equal 'Z z', effect.call('A a')

    effect = Effects.pitch_shift(26)
    assert_equal 'A a', effect.call('A a')

    effect = Effects.pitch_shift(5)
    assert_equal 'Wzgd nx kzs!', effect.call('Ruby is fun!')

    effect = Effects.pitch_shift(-1)
    assert_equal 'HAL', effect.call('IBM')

    effect = Effects.pitch_shift(-53)
    assert_equal 'ZAB zab 123!', effect.call('ABC abc 123!')

    effect = Effects.pitch_shift(52)
    assert_equal 'A a', effect.call('A a')
  end
end
