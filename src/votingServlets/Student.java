package votingServlets;

public class Student {

	private String regNo;
	private String password;
	private String firstName;
	private String lastName;
	private String residence;
	private String faculty;
	private boolean status;
	
	
	public Student(){
		regNo="";
		password="";
		firstName="";
		lastName="";
		residence="";
		faculty="";
	}
	public Student(String regNo, String password){
		this.regNo=regNo;
		this.password=password;
	}
	
	public Student(String firstName, String lastName, String regNo){
		this.firstName = firstName;
		this.lastName = lastName;
		this.regNo = regNo;
	}
    
	public Student(String regNo, String firstName, String lastName, String residence, String faculty, boolean status) {
		super();
		this.regNo = regNo;
		this.firstName = firstName;
		this.lastName = lastName;
		this.residence = residence;
		this.faculty = faculty;
		this.status = status;
	}
	public String getStatus() {
		if(status==true){
			return "voted";
		}else{
			return "not voted";
		}
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	@Override
	public String toString() {
		return "Student [firstName=" + firstName + ", lastName=" + lastName + ", status=" + status + "]";
	}
	
	
	
}
