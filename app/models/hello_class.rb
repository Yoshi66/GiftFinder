class HelloWorld
  def intialize(myname = "Ruby")
    @name = myname
  end

  def hello
    puts "Hello, World. I am #{@name}"
  end
end
