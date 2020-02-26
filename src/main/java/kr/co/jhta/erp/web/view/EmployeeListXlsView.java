package kr.co.jhta.erp.web.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.co.jhta.erp.dto.EmployeeDetailDto;

public class EmployeeListXlsView extends AbstractXlsxView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 컨트롤러가 전달한 데이터를 모델에서 획득하기
		@SuppressWarnings("unchecked")
		List<EmployeeDetailDto> employees = (List<EmployeeDetailDto>) model.get("employees");
		
		// 엑셀시트 생성하기
		XSSFSheet sheet = (XSSFSheet) workbook.createSheet("사원리스트");
		
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("사번");
		headerRow.createCell(1).setCellValue("이름");
		headerRow.createCell(2).setCellValue("전화번호");
		headerRow.createCell(3).setCellValue("이메일");
		headerRow.createCell(4).setCellValue("부서");
		headerRow.createCell(5).setCellValue("부서위치");
		headerRow.createCell(6).setCellValue("직급");
		headerRow.createCell(7).setCellValue("기본급");
		headerRow.createCell(8).setCellValue("월급");
		headerRow.createCell(9).setCellValue("부서코드");
		headerRow.createCell(10).setCellValue("직급코드");
		headerRow.createCell(11).setCellValue("입사일");
		headerRow.createCell(12).setCellValue("퇴직여부");		
		
		int dataRowIndex = 1;
		for (EmployeeDetailDto emp : employees) {
			Row dataRow = sheet.createRow(dataRowIndex++);
			dataRow.createCell(0). setCellValue(emp.getNo());
			dataRow.createCell(1).setCellValue(emp.getName());
			dataRow.createCell(2).setCellValue(emp.getTel());
			dataRow.createCell(3).setCellValue(emp.getEmail());
			dataRow.createCell(4).setCellValue(emp.getDepartmentName());
			dataRow.createCell(5).setCellValue(emp.getDepartmentLocation());
			dataRow.createCell(6).setCellValue(emp.getGradeName());
			
			Cell gradeSalaryCell = dataRow.createCell(7);
			gradeSalaryCell.setCellStyle(getNumberFormat(workbook));
			gradeSalaryCell.setCellValue(emp.getGradeSalary());		
			
			Cell salaryCell =dataRow.createCell(8);
			salaryCell.setCellStyle(getNumberFormat(workbook));
			salaryCell.setCellValue(emp.getSalary());
			
			dataRow.createCell(9).setCellValue(emp.getDepartmentNo());
			dataRow.createCell(10).setCellValue(emp.getGradeNo());
			
			Cell hireDateCell = dataRow.createCell(11);
			hireDateCell.setCellStyle(getDateCellStyle(workbook));
			hireDateCell.setCellValue(emp.getHireDate());
			
			dataRow.createCell(12).setCellValue(emp.getRetired());
		}
		
		for(int i=0; i < employees.size(); i++) {
			sheet.autoSizeColumn(i);
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 512);
		}
		sheet.setColumnWidth(5, sheet.getColumnWidth(5) + 2000);
		sheet.setColumnWidth(11,sheet.getColumnWidth(11) + 1000);
		
		setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=Employees.xlsx");
		
	}
	private CellStyle getDateCellStyle(Workbook workbook) {
		CreationHelper creationHelper = workbook.getCreationHelper();
		CellStyle cellstyle = workbook.createCellStyle();
		cellstyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-mm-dd"));
		
		return cellstyle;
	}
	
	private CellStyle getNumberFormat (Workbook workbook) {
		CellStyle cellStyle = workbook.createCellStyle();
		DataFormat format = workbook.createDataFormat();
		cellStyle.setDataFormat(format.getFormat("#,##0"));
		
		return cellStyle;
	}
	
}
