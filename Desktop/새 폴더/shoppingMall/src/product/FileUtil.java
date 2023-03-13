package product;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.oreilly.servlet.multipart.FileRenamePolicy;


public class FileUtil {

	private static String saveDirectory;
	private static int maxPostSize = 1024 * 1024 * 50;
	private static String encoding = "UTF-8";
//	private static FileRenamePolicy namePolicy = new DefaultFileRenamePolicy();
	
	public static ProductDTO getDTO(HttpServletRequest request) throws IOException {
		ProductDTO dto = null;
		
		saveDirectory = request.getServletContext().getRealPath("upload");
		
		File dir = new File(saveDirectory);
		
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		dto = new ProductDTO();
		dto.setName(mpRequest.getParameter("name"));
		dto.setKind(mpRequest.getParameter("kind"));
		dto.setPrice(Integer.parseInt(mpRequest.getParameter("price")));
		dto.setImgPath(mpRequest.getFile("uploadFile").getName());
		dto.setProduct_content(mpRequest.getParameter("product_content"));
		dto.setUploadFile(mpRequest.getFile("uploadFile"));
		
		return dto;
	}
	
	
	
}
