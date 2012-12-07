class Alexpass

  DEFAULT_LENGTH = 8

  # visually unambiguous character sets
  LN = '234'.split('')               # Left-hand Numbers
  RN = '789' .split('')              # Right       ''
  LL = 'qwertsdfgzxcv'.split('')     # Left-hand Lowercase letters
  RL = 'yuiphjknm'.split('')         # Right        ''       ''
  LU = LL.collect {|c| c.capitalize} # Left-hand Uppercase letters
  RU = RL.collect {|c| c.capitalize} # Right        ''       ''

  AMBIGUOUS = '1l6b0Oao'

  # patterns for even and odd length passwords;
  # alternating hands, with the last always being on the left;
  # only the first in each subset takes part in the "memorizable" pattern: LUUNLLNL
  @pattern_even = [[RL], [LU, LN, LL], [RU, RN, RL], [LN, LL, LU], [RL, RU, RN], [LL, LU, LN], [RN, RL, RU], [LL]]

  @pattern_odd  = [[LL], [RU, RN, RL], [LU, LN, LL], [RN, RL, RU], [LL, LU, LN], [RL, RU, RN], [LN, LL, LU], [RL]]

  # return a password
  # options = {:length => 8, :memorizable => true}
  def self.generate(options={})
    options = self._verify_options(options)
    password = ''
    iterations = options[:length]/DEFAULT_LENGTH + 1
    iterations.times { password += self._generate(options) }
    password.slice(0...options[:length])
  end

  # return the number of permutations
  # options = {:length => 8, :memorizable => true}
  def self.permutations(options={})
    options = self._verify_options(options)
    p = 1
    pattern = options[:length].even? ? @pattern_even : @pattern_odd
    plen = pattern.length
    (0...options[:length]).each { |i|
      p *= (options[:memorizable] ? pattern[i%plen][0] : pattern[i%plen].flatten).reject{|c| AMBIGUOUS.include?(c)}.length
    }
    p
  end

private

  def self._verify_options(options=nil)
    raise ArgumentError, "expected a Hash, but got: #{options.inspect}" unless options.kind_of?(Hash)
    options = {:memorizable => true, :length => DEFAULT_LENGTH}.merge(options)
    raise ArgumentError, "expected :memorizable to be boolean, but got: #{options[:memorizable].inspect}" unless options[:memorizable].kind_of?(TrueClass) || options[:memorizable].kind_of?(FalseClass)
    raise ArgumentError, "expected :length to be a Fixnum, but got: #{options[:length].inspect}" unless options[:length].kind_of?(Fixnum)
    raise ArgumentError, "expected :length > 0, but got: #{options[:length]}" unless options[:length] > 0
    options
  end

  def self._generate(options={})
    options = self._verify_options(options)
    pattern = options[:length].even? ? @pattern_even : @pattern_odd
    return pattern.collect { |i|
      s =''
      loop do
        s = _sample(i[options[:memorizable] ? 0 : rand(i.length)])
        break unless AMBIGUOUS.include?(s)
      end
      s
    }.join.slice(0..-1)
  end

  # pick a random element from the given array
  def self._sample(a=[])
    raise ArgumentError, "expected an Array, but got: #{a.class}" unless a.kind_of?(Array)
    raise ArgumentError, "expected a non-empty Array, but got an empty one" unless a.length > 0
    a[rand(a.length)]
  end

end

