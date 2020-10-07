# frozen_string_literal: true

class Tester
  attr_accessor :task, :path

  def tester(task, path)
    self.task = task
    self.path = path
  end

  def run_test
    nr = 0
    until nr.negative?
      in_file = "#{path}test.#{nr}.in"
      out_file = "#{path}test.#{nr}.out"
      break if !File.file?(in_file) || !File.file?(out_file)

      data = File.read(in_file).empty? ? '' : File.read(in_file)
      puts "Test #{nr} - " + run(in_file, out_file, check_string(data)).to_s
      nr += 1
    end
  end

  def run(_in_file, out_file, check_method)
    expect = File.read(out_file)
    actual = check_method

    actual == expect
  end

  def check_string(data)
    data.strip.length.to_s
  end
end
