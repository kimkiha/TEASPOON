package com.teaspoon.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) { // rename메소드가 실행되면서 원본파일이 매개변수에 전달됨
		// 원본명 "aaa.zip"
		String originName = originFile.getName();
		
		// 수정명 : 파일업로드한 시간(년월일시분초, YYYYMMDDHHmmSS) + 5자리 랜덤값(10000~99999) + 확장자 
		
		//    원본명 --> 수정명
		// aaa.zip --> 2019120113231199999.zip
		
		// 1. 파일 업로드한 시간 알아내기 (String currentTime)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date()); //import java.util.Date;
		
		// 2. 5자리 랜덤값(int ranNum)
		int ranNum = (int)(Math.random()*90000+10000);
		
		// 3. 확장자 (String ext) + .포함해서 알아내야 함
		// >> 원본명에 .이 위치해있는 인덱스 알아내기 
		int dot = originName.lastIndexOf(".");
		String ext = originName.substring(dot); // 시작인덱스만 제시하면 끝까지 전체 리턴
		
		// 이제 다 합쳐주기
		String fileName = currentTime + ranNum + ext;
		
		// 전달받은 원본파일(originFile)을 수정된 파일명으로 File객체 생성후 리턴
		File renameFile = new File(originFile.getParent(), fileName);
		return renameFile;
	}
	
	
	

}
