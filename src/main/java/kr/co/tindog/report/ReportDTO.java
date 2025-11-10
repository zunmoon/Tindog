package kr.co.tindog.report;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportDTO {
	
	private String reporter;
	private String reported;
	private String reason;
	private int reportcase;
}
