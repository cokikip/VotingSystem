package votingServlets;

import java.util.List;

public class Position {

	String positionName;
	List<Contestant> contestants;
	
	
	public Position(String positionName, List<Contestant> contestants) {
		this.positionName = positionName;
		this.contestants = contestants;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public List<Contestant> getContestants() {
		return contestants;
	}
	public void setContestants(List<Contestant> contestants) {
		this.contestants = contestants;
	}
	@Override
	public String toString() {
		return "Position [positionName=" + positionName + ", contestants=" + contestants + "]";
	}
	
	
	
}
