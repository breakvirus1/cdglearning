class Task_1_class
    def word_check(word)
        while word.empty? 
            return nil
            puts("введи слово")
            if word.empty?
                work_check(gets)
            end
        end
        if word.strip.split(" ").length>1 and word.strip.split(" ")[0].end_with?"cs"
            result_with_cs=(word.strip.split(" ")[0]).length
            puts("За результат берется первое слово. Результат работы: 2^#{result_with_cs} = ", 2**result_with_cs)
            return 2**result_with_cs
        elsif word.strip.end_with?"cs"
            result_with_cs=word.strip.length
            puts("Результат: 2^#{result_with_cs} = ", 2**result_with_cs)
            return 2**result_with_cs
        else 
            puts(word.reverse)
            return word.reverse
        end
    end

end


class Task_1_class_for_tests
    def word_check(word)
        while word.empty? 
            return nil
            # puts("введи слово")
            # work_check(gets)
        end
        if word.strip.split(" ").length>1 and word.strip.split(" ")[0].end_with?"cs"
            result_with_cs=(word.strip.split(" ")[0]).length
            # puts("За результат берется первое слово. Результат работы: 2^#{result_with_cs} = ", 2**result_with_cs)
            return 2**result_with_cs
        elsif word.strip.end_with?"cs"
            # result_with_cs=word.strip.length
            # puts("Результат: 2^#{result_with_cs} = ", 2**result_with_cs)
            return 2**result_with_cs
        else 
            # puts(word.reverse)
            return word.reverse
        end
    end

end

puts("Введи слово")
Task_1_class.new.word_check(gets)