test =
[
  "00100",
  "11110",
  "10110",
  "10111",
  "10101",
  "01111",
  "00111",
  "11100",
  "10000",
  "11001",
  "00010",
  "01010"
]

def calculate_max_min(values)
  max_min = []
  values.each do |val|
    val.split("").each_with_index do |digit, index|
      count = max_min[index]
      if count
        if digit == "1"
          count[1] += 1
        elsif digit == "0"
          count[0] += 1
        end
      else
        if digit == "1"
          count = [0, 1]
        elsif digit == "0"
          count = [1, 0]
        end
      end

      max_min[index] = count
    end
  end

  max_min
end

def gamma_rate(values)
  gamma_rate_str = values.each_with_object("") do |val, obj|
    obj << val.each_with_index.max[1].to_s
  end

  gamma_rate_str
end

def epsilon_rate(values)
  gamma_rate_str = values.each_with_object("") do |val, obj|
    obj << val.each_with_index.min[1].to_s
  end

  gamma_rate_str
end

values = calculate_max_min(File.readlines("./part1.txt").map(&:chomp))
rate = gamma_rate(values)
rate2 = epsilon_rate(values)
puts rate
puts rate2

puts rate.to_i(2) * rate2.to_i(2)