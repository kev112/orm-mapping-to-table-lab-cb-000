class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade

  end

  def save
    DB[:conn].execute('INSERT INTO students VALUES (?, ?)', self.name, self.grade)
  end
end
