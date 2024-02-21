class CashMachine
  def self.init
    if File.exist?('balance.txt')
      balance = File.open('balance.txt').readlines[0].to_i
    else
      balance = 100.to_i
      balance_file = File.new('balance.txt', 'w')
      File.write(balance_file, balance)
    end
    # user_operations(balance.to_i)
    self.user_operations(balance)
  end

  def self.user_operations(balance)
    puts('Какую операцию произвести?')
    puts('D-Deposit')
    puts('W-Withdraw')
    puts('B-Balance')
    puts('Q-Quit')
    user_input = gets.chomp.downcase
    puts(user_input)
    if user_input.to_s.eql?('q')
      self.exit_program(balance)
    else
      until user_input.to_s.eql?('q')
        if user_input.to_s.eql?('d')
          self.deposit_operations(balance)
          self.user_operations(balance)
        elsif user_input.to_s.eql?('w')
          self.withdraw_operations(balance)
        elsif user_input.to_s.eql?('b')
          self.output_balance_operation(balance)
        elsif user_input.to_s.eql?('q')
          self.exit_program(balance)
        else
          self.user_operations(balance)
        end
      end
    end
  end

  def self.deposit_operations(balance)
    puts("Какую сумму внести?\n1-100\n2-200\n3-500\n4-1000")
    deposit_input = gets.chomp.to_s
    if deposit_input.to_s.eql?('1')
      balance += 100
      self.check_continue_operation('deposit_operations', balance)
    elsif deposit_input.to_s.eql?('2')
      balance += 200
      self.check_continue_operation('deposit_operations', balance)
    elsif deposit_input.to_s.eql?('3')
      balance += 500
      self.check_continue_operation('deposit_operations', balance)
    elsif deposit_input.to_s.eql?('4')
      balance += 1000
      self.check_continue_operation('deposit_operations', balance)
    else
      puts('Неверно. введите цифру от 1 до 4')
      self.deposit_operations(balance)
    end
    balance
  end

  def self.withdraw_operations(balance)
    puts("Введите сумму для снятия. На счете #{balance}")
    withdraw_input = gets
    if withdraw_input.gsub(/[^\p{L}\s\d]/,
                           '').chomp.to_i.eql?(withdraw_input.chomp.to_i) and withdraw_input.gsub(/[^\p{L}\s\d]/,
                                                                                                  '').chomp.to_i <= balance
      balance -= withdraw_input.gsub(/[^\p{L}\s\d]/, '').chomp.to_i
      self.check_continue_operation('withdraw_operations', balance)
    else
      puts('Неверная сумма. Поробуйте ввести еще раз')
      self.withdraw_operations(balance)
    end
    balance
  end

  def self.output_balance_operation(balance)
    puts("На счете #{balance}.0")
    self.user_operations(balance)
  end

  def self.exit_program(balance)
    puts('Программа завершает работу')
    File.write('balance.txt', "#{balance}.0")
    exit
  end

  def self.check_continue_operation(function, balance)
    puts('Продолжить операцию?(Y/N)')
    check = gets.chomp.downcase
    if check.eql?('y')
      if function.eql?('withdraw_operations')
        self.withdraw_operations(balance.to_i)
      elsif function.eql?('deposit_operations')
        self.deposit_operations(balance.to_i)
      else
        self.user_operations(balance.to_i)
      end
    elsif check.eql?('n')
      self.user_operations(balance.to_i)
    else
      until check.eql?('y') or check.eql?('n')
        puts('Неверный ввод. Введите Y или N')
        check = gets.chomp.downcase
      end
    end
  end
end

CashMachine.init
