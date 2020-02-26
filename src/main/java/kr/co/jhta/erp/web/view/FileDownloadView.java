package kr.co.jhta.erp.web.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			
			String directory = (String) model.get("directory");
			String filename = (String) model.get("filename");
			
			File file = new File(directory, filename);
			
			String encodedFilename = URLEncoder.encode(filename, "utf-8");
			
			setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=" + encodedFilename);
			response.setHeader("Content-Length", String.valueOf(file.length()));
			FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
	}
	
}
