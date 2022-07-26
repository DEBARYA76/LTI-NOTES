package java8;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import model.Employee;

public class StreamDemo {

	public static void main(String[] args) {
		List<Employee> employees=new ArrayList<Employee>();
		employees.add(new Employee(1001, "John", 4500));
		employees.add(new Employee(1004, "Michelle", 5000));
		employees.add(new Employee(1002, "George", 3000));
		employees.add(new Employee(1003, "Chloe", 7000));
		
		Stream<Integer> streamOfInt=Stream.of(10,40,50,30,60,70,20,30,40,60,40);
		
//		streamOfInt
//				.filter(e->e>20)
//				.sorted()
//				.distinct()
//				.forEach(e->System.out.println(e));
		
//		employees.stream()
//				.filter(e->e.getSalary()>=3000)
//				.forEach(e->System.out.println(e.getEmployeeId()+" "+e.getEmployeeName()));
		
//		employees.stream()
//		.filter(e->e.getSalary()>=3000)
//		.map(e->e.getEmployeeName())  // Stream<Employee>------> Stream<String>
//		.forEach(e->System.out.println(e));
		
//		List<String> employeeNames=employees.stream()
//											.map(e->e.getEmployeeName())
//											.collect(Collectors.toList());
//		System.out.println(employeeNames);
		
//		Long countOfEmployees= employees.stream().count();
//		System.out.println(countOfEmployees);
		
		
//		Double averageSalary= employees.stream()
//				.map(e->e.getSalary())
//				.collect(Collectors.averagingDouble(e->e));
//		
//		System.out.println(averageSalary);
		
		employees.stream()
		.filter(e->e.getSalary()>=3000)
		.map(e->e.getEmployeeName())  // Stream<Employee>------> Stream<String>
		.forEach(e->System.out.println(e));
		
		
		
		
		

	}

}
