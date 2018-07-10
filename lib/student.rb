class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :id, :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    DB[:conn].execute('CREATE TABLE students (id INTEGER PRIMARY KEY, name STRING, grade INTEGER)')
  end

  def self.drop_table
      DB[:conn].execute('"DROP TABLE IF EXISTS students"')
  end

  def self.create(name:, grade:)
    student = self.new(name, grade)
    student.save
    
  end

  def save
    DB[:conn].execute('INSERT INTO students (name, grade) VALUES (?, ?)', self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end


end
