def foobar(input_info)
    if input_info.split(" ").length<2
        puts("Введите хотя бы два числа")
        foobar(gets)
    elsif input_info.split(" ").length>2
        puts("Введите не более двух чисел")
        foobar(gets)
    else
        one_num=input_info.split(" ")[0].to_i
        two_num=input_info.split(" ")[1].to_i
            if one_num==20
                puts(two_num)
            elsif two_num==20
                puts(one_num)
            else one_num
                puts(one_num+two_num)
            end
    end
end

puts("Введите 2 числа через пробел: ")

foobar(gets)

