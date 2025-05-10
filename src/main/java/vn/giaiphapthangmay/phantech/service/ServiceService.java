package vn.giaiphapthangmay.phantech.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vn.giaiphapthangmay.phantech.repository.ServiceRepository;

@Service
public class ServiceService {
    private final ServiceRepository serviceRepository;
    private final UploadService uploadService;

    public ServiceService(ServiceRepository serviceRepository, UploadService uploadService) {
        this.serviceRepository = serviceRepository;
        this.uploadService = uploadService;
    }

    public List<vn.giaiphapthangmay.phantech.domain.Service> getAllServices() {
        return serviceRepository.findAll();
    }

    public void saveService(vn.giaiphapthangmay.phantech.domain.Service service) {
        serviceRepository.save(service);
    }

    public String handleSaveUploadFile(MultipartFile imageFile, String folder) throws IOException {
        return uploadService.handleSaveUploadFile(imageFile, folder);
    }

    public vn.giaiphapthangmay.phantech.domain.Service getServiceById(long id) {
        return serviceRepository.findById(id).orElse(null);
    }

    public void deleteService(long id) {
        serviceRepository.deleteById(id);
    }

    public Map<String, String> uploadImageForTinyMCE(MultipartFile file) throws IOException {
        // Sử dụng phương thức từ UploadService
        return uploadService.uploadImageForTinyMCE(file, "public");
    }

}