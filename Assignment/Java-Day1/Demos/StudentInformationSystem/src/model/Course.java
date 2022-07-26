package model;

public class Course {
	private int courseId;
	private String courseName;
	private int durationInMonths;
	private double fee;
	private Qualification eligibility;

	public Course() {
		// TODO Auto-generated constructor stub
	}

	public Course(String courseName, int durationInMonths, double fee, Qualification eligibility) {
		super();
		this.courseName = courseName;
		this.durationInMonths = durationInMonths;
		this.fee = fee;
		this.eligibility = eligibility;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getDurationInMonths() {
		return durationInMonths;
	}

	public void setDurationInMonths(int durationInMonths) {
		this.durationInMonths = durationInMonths;
	}

	public double getFee() {
		return fee;
	}

	public void setFee(double fee) {
		this.fee = fee;
	}

	public Qualification getEligibility() {
		return eligibility;
	}

	public void setEligibility(Qualification eligibility) {
		this.eligibility = eligibility;
	}

	public int getCourseId() {
		return courseId;
	}

}
