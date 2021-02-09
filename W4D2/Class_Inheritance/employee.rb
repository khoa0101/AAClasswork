class Employee

    attr_reader :salary

    def initialize(name, salary, title, boss)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multiplier)
        salary * multiplier 
    end

end

class Manager < Employee

    def initialize(name, salary, title, boss)
        super
        @employees = []
    end

    def add_employees(*employees)
        @employees = employees
    end

    def bonus(multiplier)
        @employees.map { |employee| employee.salary }.sum * multiplier
    end

end


p ned = Manager.new("Ned", 1000000, "Founder", nil)
p darren = Manager.new("Darren", 78000, "TA Manager", ned)
p shawna = Employee.new("Shawna", 12000, "TA", darren)
p david = Employee.new("David", 10000, "TA", darren)

ned.add_employees(darren, shawna, david)
darren.add_employees(shawna, david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000