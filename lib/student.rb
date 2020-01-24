require_relative "../config/environment.rb"

class Student

  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER)
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students")
  end

  def save
    sql = "INSERT INTO songs (name, album) VALUES (?, ?)"
    DB[:conn].execute(sql, self.name, self.album)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end

  def self.create(id=nil, name, grade)
    student = self.new(id=nil, name, grade)
    student.save
    student
  end

  def self.new_from_db(array)
    sql = <<-SQL
      INSERT INTO students
    SQL
    DB[:conn].execute(sql)
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM songs WHERE name = ?"
    DB[:conn].execute(sql, name)[0][0]
  end

  def update
    sql = <<-SQL
      students 
    SQL
    DB[:conn].execute(sql)
  end

end
