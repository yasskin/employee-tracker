require('spec_helper')

describe(Division) do
  describe('#employees') do
    it('returns a list of employees') do
      test_div = Division.create({:name => "HR"})
      test_emp1 = Employee.create({:name => "Cory", :division_id => test_div.id})
      test_emp2 = Employee.create({:name => "Noah", :division_id => test_div.id})
      expect(test_div.employees()).to(eq([test_emp1, test_emp2]))
    end
  end
end
