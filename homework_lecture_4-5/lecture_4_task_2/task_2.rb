# к файлу с готовыми фамилиями с repo github дописал имя и возраст
class File_stud_append
  def studadd
    new_file = 'created_file.txt'
    temp_res = []
    File.foreach('male_surnames_rus.txt') { |line| temp_res.push("#{line.chomp} Федор #{Random.rand(18..25)}") }
    File.write(new_file, temp_res.join("\n"), mode: 'a')
  end
end

class File_stud_operations
  def main(source_file, result)
    result = File.new(result, 'a')
    File.truncate(result, 0)
    puts('Введи возраст студента: ')
    info = gets.chomp
    age = info.to_i
    if !info.to_s.eql?('-1')
      until info.to_s.eql?('-1') or check_equal(source_file, result)
        # break if info.to_s == '-1'
        readfile_to_result(source_file, result, age)
        puts('Введи возраст студента: ')
        info = gets.chomp
        age = info.to_i
      end
    else
      readfile_to_result(source_file, result, age)
    end
    # puts(File.read('result.txt').split("\n").length)
    # puts(File.read(source_file).split("\n").length)
    # puts(check_equal(source_file, result))
    puts(File.read('result.txt').split("\n"))
  end

  def readfile_to_result(source_file, result, age)
    File.readlines(source_file).map do |line|
      result.puts(line.to_s) if line.split(' ')[2].to_i == age.to_i
    end
  end

  def check_equal(source_file, result)
    File.read(result).split("\n").length == File.read(source_file).split("\n").length
  end
end

File_stud_operations.new.main('created_file.txt', 'result.txt')
