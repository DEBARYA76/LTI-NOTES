package view;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.NavigableMap;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import model.Employee;
import model.Student;

public class CollectionsDemo {

	public static void main(String[] args) {
		//Iterable<Integer> nums= new ArrayList<Integer>();
		Collection<String> strs=new HashSet<String>();
		
		List<Double> doubles=new ArrayList<Double>();
		List<Double> doubles1=new LinkedList<Double>();
		
		Set<Integer> numsSet1=new HashSet<Integer>();
		Set<Integer> numsSet2=new TreeSet<Integer>();
		
		List<Integer> nums= new ArrayList<Integer>();
//		int[] arr=new int[1000];

		
//		numsSet1.add(10);
//		numsSet1.add(30);
//		numsSet1.add(20);
//		numsSet1.add(40);
//		numsSet1.add(50);
//		
//		System.out.println(numsSet1);
		
//		nums.add(10);
//		nums.add(30);
//		nums.add(20);
//		nums.add(40);
//		nums.add(50);
//		
//		System.out.println(nums);
		
		//TreeSet
//		numsSet2.add(10);
//		numsSet2.add(30);
//		numsSet2.add(20);
//		numsSet2.add(40);
//		numsSet2.add(50);
//		
//		System.out.println(numsSet2);
		
		//NavigableMap<K, V>
		
		//Comparable and Comparator
		
		List<Employee> employees=new ArrayList<Employee>();
		employees.add(new Employee(1001, "John", 4500));
		employees.add(new Employee(1004, "Michelle", 5000));
		employees.add(new Employee(1002, "George", 3000));
		employees.add(new Employee(1003, "Chloe", 7000));
		
		Collections.sort(nums);
		//Collections.sort(employees);  // Comparable: compareTo
		//Collections.sort(employees, new SortByName());
		Comparator<Employee> comparable=(e1,e2)->e1.getEmployeeName().compareTo(e2.getEmployeeName());
		
		Collections.sort(employees,comparable);
		//Collections.sort(employees,(a,b)->Double.compare(a.getSalary(), b.getSalary()));
		
		employees.stream()
				// .sorted()             // Comparable: compareTo
				//.sorted(new SortByName())
				.forEach(System.out::println);
		
		
		
		
		
	}

}
