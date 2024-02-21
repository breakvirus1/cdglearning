class Task_2_class
  def add_bunnies(count_bunnies)
    hash_bunnies = {}
    if count_bunnies < 1
      puts("некорректное число")
      Task_2_class.new.add_bunnies(gets.to_i)
      # hash_bunnies = { nil => nil }
    else
      for i in (1..count_bunnies)
        puts("введи данные #{i} кролика")
        words_in_string = gets
        if words_in_string == ""
          puts("Неверная информация. Введи коррекные данные #{i} кролика")
          # hash_bunnies = { nil => nil }
        elsif words_in_string.to_s.strip.split(" ").length == 1
          puts("Неверная информация. Введи коррекные данные #{i} кролика")
          # hash_bunnies = { nil => nil }
        elsif words_in_string.to_s.strip.split(" ").length > 1
          data_bunni = words_in_string.to_s.strip.split(" ")
          hash_bunnies = { data_bunni[0] => data_bunni[1] }
        end
      end
    end
    puts(hash_bunnies)
    # return hash_bunnies
  end
end

puts("Введите количество кроликов: ")
Task_2_class.new.add_bunnies(gets.to_i)#создал экземпляр класса Task 2 class
