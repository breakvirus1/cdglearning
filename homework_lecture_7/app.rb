require 'rack'
require './task_1'

# Создали отдельно работующее приложение
class App
  # Оно умеет обрабатывать запросы от сервера и возвращать данные с помощью этого метода-роутера
  def call(env)
    req = Rack::Request.new(env)
    params = req.query_string.split('&').map { |param| param.split('=') }.to_h

    case req.path
    when '/'
      [200, { 'Content-Type' => 'text/html' }, ['<h1>Hello world</h1>']]
    when '/deposit_operations'
      result = cashmachine_controller(params)
      [200, { 'Content-Type' => 'text/html' }, ["<h1>#{result}</h1><a href="'>домой</a></h2>']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['<h1>404</h1>']]
    end
  end

  # Наш контроллер в который поступают данные из роутера
  def cashmachine_controller(params)
    cash_object = CashMachine.new(params['money'].to_i)
    case params['action']
    when 'deposit'
      cash_object.deposit_operations
    when 'withdraw'
      cash_object.withdraw_operations
    when 'show'
      cash_object.output_balance_operation
    end
    "Result: #{cash_object.balance}"
  end
end
