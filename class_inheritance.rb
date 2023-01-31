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
        #Need a new base case, 
        #return self.bonus(multiplier) if self.employees.nil?
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
        # @employees.each do |employee|
        #     new_bonus = employee.bonus(multiplier)
        #     sum += new_bonus
        #     # return sum * multiplier if employee.nil?
        #     # sum += employee.bonus(multiplier)
        end
        sum * multiplier
    end
 
end