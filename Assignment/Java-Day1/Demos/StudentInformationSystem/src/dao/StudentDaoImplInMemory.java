package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import model.Registration;
import model.Student;

public class StudentDaoImplInMemory implements StudentDao {

	public static List<Student> students=new ArrayList<Student>();
	
	@Override
	public void addNewStudent(Student student) {
		students.add(student);
	}

	@Override
	public void updateStudentProfile(Student student) {
		
	}

	@Override
	public boolean registration(Registration registration) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Student findStudentByRollNo(int rollNo) {
		
		//boolean isFound= students.stream().anyMatch(st->st.getRollNo()==rollNo);
		return students.stream().filter(st->st.getRollNo()==rollNo)
						 .findFirst()
						 .get();
						 
	}

	@Override
	public List<Student> viewAllStudents() {
		return students.stream().collect(Collectors.toList());
	}

	
}
