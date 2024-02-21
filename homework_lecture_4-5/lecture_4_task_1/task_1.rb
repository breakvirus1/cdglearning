class File_operations # rubocop:disable Style/Documentation
  BUFFER = 'temp.txt'
  def index(file_name)
    puts('index')
    File.open(file_name, 'r').readlines.map { |line| line.chomp }
  end

  def find(file_name, num)
    puts('find')
    IO.readlines(file_name)[num]
  end

  def where(file_name, pattern) # rubocop:disable Metrics/MethodLength
    puts('where')
    result = []
    file = File.open(file_name).readlines.map { |line| line.chomp }
    File.foreach(file_name).with_index do |actor, index|
      result.push(file[index]) if actor.include?(pattern)
    end

    if result.length.positive?
      result
    else
      puts('no line found in this file')
    end
  end

  def update(file_name, id, text)
    puts('update')
    file = File.new(BUFFER, 'w')
    File.foreach(file_name).with_index do |line, index|
      file.puts(id == index ? text : line)
    end
    file.close
    File.write(file_name, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
  end

  def delete(file_name, id)
    puts('delete')
    file = File.new(BUFFER, 'w')
    File.foreach(file_name).with_index do |line, index|
      file.write(line) if id != index
    end
    file.close
    File.write(file_name, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
  end

  def create(file_name, text)
    File.open(file_name, 'a').write(text)
  end
end
puts(File_operations.new.index('file.txt'))
puts
puts(File_operations.new.find('file.txt', 3))
puts
puts(File_operations.new.where('file.txt', 'qwerty'))
puts
puts(File_operations.new.update('file.txt', 1, 'qwerty'))
puts
puts(File_operations.new.delete('file.txt', 0))
puts
puts(File_operations.new.create('file.txt', 'insterted text'))