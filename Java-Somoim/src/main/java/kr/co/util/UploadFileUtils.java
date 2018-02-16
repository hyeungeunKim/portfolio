package kr.co.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	private static final Logger LOGGER = LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalName;
		savedName.replaceAll(" ",""); // 띄어쓰기 있는 이름 처리
		
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath+savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
			
		
		String formatname = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if(MediaUtils.getMediaType(formatname) != null){
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} 
		return uploadedFileName;
	}
	
	private static String makeIcon(String uploadPath, String savedPath, String savedName) {
		String iconName = uploadPath+savedPath+File.separator+savedName;
		String re = iconName.substring(uploadPath.length()).replace(File.separatorChar,'/');
		return re;
	}

	private static String calcPath(String uploadPath){
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		LOGGER.info("연도: "+yearPath);
		
		String monthPath = yearPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		LOGGER.info("월: "+monthPath);
		
		String datePath = monthPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		LOGGER.info("일: "+datePath);
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}

	private static void makeDir(String uploadPath, String...paths) {
		File f = new File(paths[paths.length-1]);
		if(f.exists()){
			return;
		} 
		
		for(String path:paths){
			File dirPath = new File(uploadPath+path);
			if(!dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		
		File sF = new File(uploadPath+path, fileName);
		BufferedImage sourceImg = ImageIO.read(sF);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		String thumbnailName = uploadPath+path+File.separator+"s_"+fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		String re = thumbnailName.substring(uploadPath.length()).replace(File.separatorChar,'/');
		
		return re;
	}
	
}
