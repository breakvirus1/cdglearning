class CashMachine
  attr_reader :balance

  def initialize(money)
    @money = money
    if File.exist?('balance.txt')
      @balance = File.open('balance.txt').readlines[0].to_i
    else
      @balance = 100.to_i #добавляю коммент для newbranchtest
      balance_file = File.new('balance.txt', 'w') #еще коммент
      File.write(balance_file, balance)
    end
  end

  def deposit_operations
    initialize(@money)
    @balance += @money
    File.write('balance.txt', @balance)
  end

  def withdraw_operations
    initialize(@money)
    @balance -= @money
    File.write('balance.txt', @balance)
  end

  def output_balance_operation
    initialize(@money)
    @balance
  end
end
