require 'spec_helper'

describe(Employee) do
  describe('#division') do
    it('returns the name of the division associated with an employee') do
      test_div = Division.create({:name => "HR"})
      test_emp1 = Employee.create({:name => "Mike", :division_id => test_div.id})
      expect(test_emp1.division()).to(eq(test_div))
    end
  end
end
