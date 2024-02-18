module CashMachine
  def check_data
    data_array = []
    if File.exist?(@filename) and !File.zero?(@filename)
      read_from_file
    else
      puts('база пуста. оставьте первый пост:')
      first_post = gets.chomp
      data_array << first_post
      File.open(@filename, 'a') do |file|
        data_array.each { |post_string| file.puts post_string }
      end
    end
  end

  def output_file
    IO.foreach(@filename) { |line| puts line }
  end

  def show_post
    puts('введи номер поста:')
    id = gets.to_i
    data_array = IO.readlines(@filename, chomp: true)
    puts(data_array[id])
  end

  def create_post
    data_array = []
    puts('введи текст нового поста:')
    new_post = gets.chomp
    File.open(@filename, 'a') do |file|
      data_array << file
      data_array << new_post
      data_array.each { |post_string| file.puts post_string }
    end
  end

  def update_post
    data_array = []
    puts('введи номер поста:')
    num_of_post = gets.to_i
    puts('введи текст поста:')
    text_post = gets.chomp
    data_array = IO.readlines(@filename, chomp: true)
    data_array[num_of_post] = text_post
    File.open(@filename, 'w') do |file|
      data_array.each { |post_string| file.puts post_string }
    end
  end

  def destroy_post
    puts('введи номер поста:')
    num_of_post = gets.to_i
    data_array = IO.readlines(@filename, chomp: true)
    data_array.delete_at(num_of_post)
    File.open(@filename, 'w') do |file|
      data_array.each { |post_string| file.puts post_string }
    end
  end
end
