package dao;

import java.util.List;

import model.Registration;
import model.Student;

public interface StudentDao {
	void addNewStudent(Student student);
	void updateStudentProfile(Student student);
	boolean registration(Registration registration);
	Student findStudentByRollNo(int rollNo);
	List<Student> viewAllStudents();
}
