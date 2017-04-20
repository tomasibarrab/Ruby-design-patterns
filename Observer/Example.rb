module Subject
  def initialize
    @observers=[]
  end

  def add_observer(observer)
    @observers.push(observer)
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end


class Employee
  include Subject
  attr_accessor :name, :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end


class Payroll
  def update( changed_employee )
    puts("You should check #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end


class TaxMan
  def update(changed_employee)
    puts
    puts("Send #{changed_employee.name} a new tax bill!")
  end
end


# Creates a new employee
tomas = Employee.new('Tomas Ibarra', 'Ruby Dev', 20000.0)

# Creates a new payroll
payroll = Payroll.new
tomas.add_observer(payroll)

# Creates a new taxman
tax_man = TaxMan.new
tomas.add_observer(tax_man)

tomas.salary = 24000.0
