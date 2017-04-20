class Payroll
  def update( changed_employee )
    puts("You should check #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end
