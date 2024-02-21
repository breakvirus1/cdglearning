class Task_2_class_for_tests
  def add_bunnies(count_bunnies, words_in_string)
    hash_bunnies = {}
    if count_bunnies < 1
      hash_bunnies = { nil => nil }
    else
      for i in (1..count_bunnies)
        if words_in_string == ""
          hash_bunnies = { nil => nil }
        elsif words_in_string.to_s.strip.split(" ").length == 1
          hash_bunnies = { nil => nil }
        elsif words_in_string.to_s.strip.split(" ").length > 1
          data_bunni = words_in_string.to_s.strip.split(" ")
          hash_bunnies = { data_bunni[0] => data_bunni[1] }
        end
      end
    end

    return hash_bunnies
  end
end
