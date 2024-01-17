def greeting(input_info)
    name=input_info.split(" ")[0].to_s.capitalize()
    fam=input_info.split(" ")[1].to_s.capitalize()
    age=input_info.split(" ")[2].to_i
        if age<18 and age>0 and name.scan(/[0123456789!@#$%^&*()_+{}\[\]:;'"\/\\?><.,]/).empty? 
            puts("Привет, #{name} #{fam}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
        elsif age>=18 and name.scan(/[0123456789!@#$%^&*()_+{}\[\]:;'"\/\\?><.,]/).empty? 
            puts("Привет, #{name} #{fam}. Самое время заняться делом!")
        else 
            puts("Проверьте введенные данные. Имя и фамилия должны состоять только из букв, а возраст из цифр") 
            puts("Введите имя, фамилию, возраст через пробел:")
            greeting(gets)
        end
end

puts("Введите имя, фамилию, возраст через пробел:")

greeting(gets)

