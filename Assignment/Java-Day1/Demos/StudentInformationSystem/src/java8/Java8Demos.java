package java8;

import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

import model.Employee;

interface Java8Interface{
	int num=10;    //public static final   
	void abstractMethod1();
	void abstractMethod2();
	default void defaultMethod() {System.out.println("Interface default method");}
	static void staticMethod() {
	}
}

@FunctionalInterface
interface Shape{              //Functional interface
	double area(double radius);
	//void perimeter();
	default void perimeter() {}
	static double getPI() {return 3.14;}
}
//class Circle implements Shape{
//	
//	@Override
//	public double area(double radius) {
//		return 3.14*radius*radius;
//	}
//}
public class Java8Demos {
	public static void main(String[] args) {
		
//		Java8Interface interface1=new ImplementedClass();
//		interface1.defaultMethod();
//		Java8Interface.staticMethod();
		
//		Shape shape=new Circle();
//		double res= shape.area(4.5);
//		System.out.println(res);
		
		//Anonymous class
//		Shape shape=new Shape() {
//			@Override
//			public double area(double radius) {
//				return 3.14*radius*radius;
//			}
//		};
//		double res= shape.area(4.5);
//		System.out.println(res);
		
		//Lambda expression
		Shape shape=(double radius)->{return 3.14*radius*radius;};
		
		double res= shape.area(4.5);
		System.out.println(res);
		
		//Calc<Integer> calcInt=(n1,n2)->n1+n2;
		//Calc<Integer> calcInt=(n1,n2)->{return n1+n2;};
		
		
		//int result= calcInt.add(10, 20);
		//System.out.println(result);
		
//		Calc<Double> calcDouble=(n1,n2)->System.out.println(n1+n2);
//		calcDouble.add(10.5, 30.3);
//		
//		Calc<Integer> calcInt=(n1,n2)->System.out.println(n1+n2);
//		calcInt.add(10, 30);
		
//		Calc<Integer> calcInt=()->{
//			Scanner sc=new Scanner(System.in);
//			System.out.println("Enter two numbers:");
//			int num1=sc.nextInt();
//			int num2=sc.nextInt();
//			System.out.println("Sum= "+(num1+num2));
//		};
//		
//		calcInt.add();
		Calc<Integer> calcInt=a->a*a;
		System.out.println(calcInt.square(10));
		
	}
}
@FunctionalInterface
interface Calc<T>{
	//T add(T num1,T num2);
	//void add(T num1,T num2);
	//void add();
	T square(T num);
}

//@FunctionalInterface
//interface Calc{
//	 int add(int num1,int num2);
//}
























class ImplementedClass implements Java8Interface{

	@Override
	public void abstractMethod1() {
		
	}

	@Override
	public void abstractMethod2() {}
	
	
}

