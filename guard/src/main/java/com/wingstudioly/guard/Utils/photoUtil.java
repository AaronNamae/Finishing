/**
 * ClassName: photoService <br/>
 * Description: <br/>
 * date: 2021/4/28 16:52<br/>
 *
 * @author li yi<br/>
 */
package com.wingstudioly.guard.Utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * ClassName:photoService<br/>
 * Description:<br/>
 * date:2021/4/28 16:52<br/>
 *
 * @author li yi<br/>
 */

public class photoUtil {

    public static String imgSaveOrUpdate(String path ,MultipartFile multipartFile, String carName) {
        String suffix = Objects.requireNonNull(multipartFile.getOriginalFilename()).substring(multipartFile.getOriginalFilename().lastIndexOf("."));
        String imgFile = path + "\\" + carName + suffix;
        saveFile(imgFile, multipartFile);
        return imgFile;
    }

    private static void saveFile(String fileName, MultipartFile multipartFile) {
        File toFile = new File(fileName);
        if (!toFile.getParentFile().exists()) {
            //当文件夹不存在时，会创建文件夹
            toFile.mkdirs();
        }
        try {
            multipartFile.transferTo(toFile);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
