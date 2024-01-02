require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end



get("/square/new") do 
  erb(:new_square_calc)
end


get("/square/results") do 
  @the_num = params.fetch("number")
  @the_result = @the_num.to_f ** 2 

  erb(:square_results)
end


get("/square_root/new") do 
  erb(:square_root_calc)
end

get("/square_root/results") do 
  @the_num = params.fetch("user_number")
  @the_result = Math.sqrt(@the_num.to_f)

  erb(:square_root_results)
end


get("/random/new") do 
  erb(:random_calc)
end

get("/random/results") do 
  @first_num = params.fetch("user_min")
  @second_num = params.fetch("user_max")

  @result = rand(@first_num.to_f...@second_num.to_f)
  erb(:random_results)
end


get("/payment/new") do 
  erb(:payment_calc)
end

get("/payment/results") do 
  @apr = params.fetch("user_apr").to_f
  @principal = params.fetch("user_principal").to_f
  @years = params.fetch("user_years").to_i

  @r = (@apr / 100) / 12
  @n = @years * 12

  @numerator = @r * (@principal)
  @denominator = 1 - ((1 + @r)**(-@n))

  @result = @numerator / @denominator
  erb(:payment_results)
end
