package votingServlets;

public class Contestant {

	String base64image;
	String firstName;
	String lastName;
	int votes;
	
	
	public Contestant(String base64image, String firstName, String lastName) {
		this.base64image = base64image;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	public Contestant(String firstName, String lastName, int votes) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.votes = votes;
	}

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public String getName(){
		return firstName+"_"+lastName;
	}
	public String getBase64image() {
		return base64image;
	}
	public void setBase64image(String base64image) {
		this.base64image = base64image;
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
	@Override
	public String toString() {
		return "Contestant [base64image=" + base64image + ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}
	
	
}
