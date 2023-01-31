class Employee
    attr_accessor :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

    end
    def bonus(multiplier)
        return @salary * multiplier
    end

end

class Manager < Employee

    attr_accessor :employees

    def initialize(name, title, salary, boss, employees = [])
        super(name, title, salary, boss)
        @employees = []

    end

    def bonus(multiplier)
        return @employees[0].salary * multiplier if @employees.length == 1
        sum = 0
        @employees.each do |employee|
            return sum * multiplier if employee.nil?
            sum += employee.bonus(multiplier)
        end
        sum
    end
 
end