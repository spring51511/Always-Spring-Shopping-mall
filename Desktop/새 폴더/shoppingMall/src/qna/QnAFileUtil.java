package qna;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;


public class QnAFileUtil {

	private static String saveDirectory;
	private static int maxPostSize = 1024 * 1024 * 50;
	private static String encoding = "UTF-8";
	private static FileRenamePolicy namePolicy = new DefaultFileRenamePolicy();
	
	public static QnaDTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		QnaDTO dto = null;
		
		saveDirectory = request.getServletContext().getRealPath("upload");
		
		File dir = new File(saveDirectory);
		
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, namePolicy);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d1 = sdf.parse(mpRequest.getParameter("qnaDate"));
		java.sql.Date d2 = new java.sql.Date(d1.getTime());
		
		dto = new QnaDTO ();
		dto.setSubject(mpRequest.getParameter("QnAidx"));
		dto.setContent(mpRequest.getParameter("content"));
		dto.setUserid(mpRequest.getParameter("userid"));
		dto.setQnaDate(d2);
		
		return dto;
	}
	
	
	
}

