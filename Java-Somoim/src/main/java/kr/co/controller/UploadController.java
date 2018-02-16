package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.util.MediaUtils;
import kr.co.util.UploadFileUtils;

@Controller
public class UploadController {
	
	@Resource(name="sgallery_uploadPath")
	private String sgallery_uploadPath;
	
	@Resource(name="sboard_uploadPath")
	private String sboard_uploadPath;
	
	@Resource(name="crew_uploadPath")
	private String crew_uploadPath;
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){	// 이미지 파일이면
			
			String prefix = fileName.substring(0, 12);
			String suffix = fileName.substring(14);
			
			File f = new File(sgallery_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
			// '/'를 '\'로 바꾸는 작업
			f.delete();
		}
		File s = new File(sgallery_uploadPath+fileName.replace('/', File.separatorChar));
		// 이미지 파일이 아닌 파일들 삭제
		s.delete();
		
		return new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/deleteFile/sboard", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile_sBoard(String fileName){
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){	// 이미지 파일이면
			
			String prefix = fileName.substring(0, 12);
			String suffix = fileName.substring(14);
			
			File f = new File(sboard_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
			// '/'를 '\'로 바꾸는 작업
			f.delete();
		}
		File s = new File(sboard_uploadPath+fileName.replace('/', File.separatorChar));
		// 이미지 파일이 아닌 파일들 삭제
		s.delete();
		
		return new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/deleteFile/crew", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile_crew(String fileName){
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){	// 이미지 파일이면
			
			String prefix = fileName.substring(0, 12);
			String suffix = fileName.substring(14);
			
			File f = new File(crew_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
			// '/'를 '\'로 바꾸는 작업
			f.delete();
		}
		File s = new File(crew_uploadPath+fileName.replace('/', File.separatorChar));
		// 이미지 파일이 아닌 파일들 삭제
		s.delete();
		
		return new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(sgallery_uploadPath+fileName);
			
			if(mType != null){	//이미지 파일이면,	
				headers.setContentType(mType);
			} 
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally{
			if(in != null) in.close();
		}
		return entity;
	}
	/*---------------------------------------------------------------------------------------*/
	@ResponseBody
	@RequestMapping(value="/displayFile/sboard")
	public ResponseEntity<byte[]> displayFile_sBoard(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(sboard_uploadPath+fileName);
			
			if(mType != null){	//이미지 파일이면,	
				headers.setContentType(mType);
			} 
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally{
			if(in != null) in.close();
		}
		return entity;
	}
	
	
/*---------------------------------------------------------------------------------------*/
	@ResponseBody
	@RequestMapping(value="/displayFile/crew")
	public ResponseEntity<byte[]> displayFile_crew(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(crew_uploadPath+fileName);
			
			if(mType != null){	//이미지 파일이면,	
				headers.setContentType(mType);
			} 
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally{
			if(in != null) in.close();
		}
		return entity;
	}
	
	
	/*---------------------------------------------------------------------------------------*/
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		System.out.println("originalFilename: "+file.getOriginalFilename());
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
	
		String uploadedFileName = UploadFileUtils.uploadFile(sgallery_uploadPath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(uploadedFileName, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax(){
	}
	/*---------------------------------------------------------------------------------------*/

	@RequestMapping(value="/uploadAjax/sboard", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax_sboard(MultipartFile file) throws Exception{
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		System.out.println("originalFilename: "+file.getOriginalFilename());
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
	
		String uploadedFileName = UploadFileUtils.uploadFile(sboard_uploadPath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(uploadedFileName, HttpStatus.CREATED);
	}
	
	
		
	@RequestMapping(value="/uploadAjax/sboard", method=RequestMethod.GET)
	public void uploadAjax_sboard(){
	}
 	
	/*---------------------------------------------------------------------------------------*/

	@RequestMapping(value="/uploadAjax/crew", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax_crew(MultipartFile file) throws Exception{
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		System.out.println("originalFilename: "+file.getOriginalFilename());
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
	
		String uploadedFileName = UploadFileUtils.uploadFile(crew_uploadPath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(uploadedFileName, HttpStatus.CREATED); 	
	}
	
	
		
	@RequestMapping(value="/uploadAjax/crew", method=RequestMethod.GET)
	public void uploadAjax_crew(){
	}
	
}
