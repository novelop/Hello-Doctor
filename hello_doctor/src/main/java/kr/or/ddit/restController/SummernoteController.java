package kr.or.ddit.restController;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.ddit.util.MakeFileName;


@RestController
public class SummernoteController {

		@Resource(name = "imgPath")
		private String imgPath;

		@RequestMapping(value="/uploadImg", produces = "text/plain;charset=utf-8")
		public ResponseEntity<String> uploadImg(MultipartFile file, HttpServletRequest request){

			ResponseEntity<String> result = null;

			int fileSize = 5 * 1024* 1024;
			if(file.getSize() > fileSize) {
				return new ResponseEntity<String>("용량 초과입니다", HttpStatus.BAD_REQUEST);
			}

			String savePath = imgPath.replace("/",File.separator);
			String fileName = MakeFileName.toUUIDFileName(file.getOriginalFilename(), "");
			File saveFile = new File(savePath, fileName);

			saveFile.mkdirs();

			try {
			file.transferTo(saveFile);
			result = new ResponseEntity<String>(request.getContextPath()+"/getImg.do?fileName="+fileName, HttpStatus.OK);
			}catch(IOException e) {
			result = new ResponseEntity<String>(request.getContextPath()+"/getImg.do?fileName="+fileName,HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return result;

		}

		@RequestMapping("/getImg")
		public ResponseEntity<byte[]> getImg(String fileName)throws Exception{
			ResponseEntity<byte[]> entity = null;
			InputStream in = null;
		System.out.println(fileName);
			//String savePath = imgPath.replace("/", File.separator);
			File sendFile = new File(imgPath, fileName);

			try {
			in = new FileInputStream(sendFile);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			}catch(IOException e) {
				e.printStackTrace();

			}finally {
				in.close();
			}
			return entity;
		}

		@RequestMapping("/deleteImg")
		public ResponseEntity<String> deleteImg(@RequestBody Map<String,String> data){

			ResponseEntity<String> result = null;

			String savePath = imgPath.replace("/", File.separator);
			File target = new File(savePath, data.get("fileName"));

			if(!target.exists()) {
				result = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);

			}else {
				target.delete();
				result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			return result;
		}



		@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
		@ResponseBody
		public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

			JsonObject jsonObject = new JsonObject();

			String fileRoot = imgPath;	//저장될 외부 파일 경로
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

			File targetFile = new File(fileRoot + savedFileName);

			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
				jsonObject.addProperty("responseCode", "success");

			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}

			return jsonObject;
		}
}
