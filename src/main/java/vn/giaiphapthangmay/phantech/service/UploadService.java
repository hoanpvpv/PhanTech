package vn.giaiphapthangmay.phantech.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext; // Khai báo biến servletContext

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext; // Khởi tạo servletContext từ ServletContext
    }

    public String handleSaveUploadFile(MultipartFile avatarFile, String targetFolder) {
        if (avatarFile.isEmpty()) {
            return ""; // Trả về null nếu file rỗng
        }

        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            byte[] bytes = avatarFile.getBytes();

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            finalName = System.currentTimeMillis() + "-" + avatarFile.getOriginalFilename();
            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi nếu có

        }
        return finalName; // Trả về đường dẫn của file đã lưu trên server
    }

    public Map<String, String> uploadImageForTinyMCE(MultipartFile file, String targetFolder) throws IOException {
        // Lưu file và lấy tên file
        String savedFileName = handleSaveUploadFile(file, targetFolder);

        // TinyMCE yêu cầu trả về JSON với thuộc tính "location" chứa URL của ảnh
        Map<String, String> response = new HashMap<>();
        response.put("location", "/images/" + targetFolder + "/" + savedFileName);

        return response;
    }
}