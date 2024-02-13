require './task-1'
require 'csv'
module CashMachine
  attr_reader :data_array

  def initialize
    if File.exist?('data.csv')
      data = CSV.open('data.csv', 'a')
      data_array = data.each.to_a
    else
      puts('база пуста. оставьте первый пост:')
      data_array[0] = gets.chomp
      data = File.write('data.csv', rows.map(&:to_csv).join)
    end
  end

  def create_post
    initialize
    data_array.push(gets.chomp)
    puts(data_array)
    File.write(data, rows.map(&:to_csv).join)
  end
end

module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource
  include CashMachine
  def initialize
    @posts = []
    # @balance = balance
  end

  def index
    CashMachine.create_post
  end

  def show
    puts 'show'
  end

  def create
    puts 'create'
  end

  def update
    puts 'update'
  end

  def destroy
    puts 'destroy'
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
