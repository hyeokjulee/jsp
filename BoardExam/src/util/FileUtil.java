package util;

import java.io.*;

public class FileUtil {

	public static void saveImage(String root, String fbname, byte[] data) throws IOException {
		
		root += "/images";
		File f = new File(root); 
		if (!f.exists()) {
			f.mkdir(); //images 폴더가 없을때, 즉 처음에만 생성
		}
		
		f = new File(root + "/" + fbname);
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
	}
}