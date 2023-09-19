file = File.open("teste.txt", "a");

puts "informe seu nome";

userName = gets;

puts "\nOlá, #{userName}";

file.write(userName);

file.close;