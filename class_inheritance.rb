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
        sum = 0
        queue = [self]
        while !queue.empty?
            front_q = queue.shift
            if front_q.is_a?(Manager)
                front_q.employees.each do |employee|
                    queue << employee 
                    sum += employee.salary
                end
            end
        end
        sum * multiplier
    end
 
end

#load 'class_inheritance.rb'
#Ned = Manager.new("Ned","Founder",1000000, nil)
#Darren = Manager.new("Darren","TA Manager",78000, Ned)
#Shawna = Employee.new("Shawna", "TA", 12000, Darren)
#David = Employee.new("David", "TA", 10000, Darren)
#Ned.employees << Darren
#Darren.employees << David
#Darren.employees << Shawna

#RECURSIVE METHOD ON MANAGER'S BONUS
# def bonus(multiplier)
#     self.total_subsalary * multiplier
# end

# def total_subsalary
#     total_subsalary = 0
#     self.employees.each do |employee|
#         if employee.is_a?(Manager)
#             total_subsalary += employee.salary + employee.total_subsalary
#         else
#             total_subsalary += employee.salary
#         end
#     end
#     total_subsalary
# end