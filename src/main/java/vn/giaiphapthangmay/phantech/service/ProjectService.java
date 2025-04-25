package vn.giaiphapthangmay.phantech.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Project;

import vn.giaiphapthangmay.phantech.repository.ProjectRepository;
import vn.giaiphapthangmay.phantech.repository.ServiceRepository;

@Service
public class ProjectService {

    private final UploadService uploadService;
    private final ProjectRepository projectRepository;
    private final ProductService productService;
    private final ServiceRepository serviceRepository; // Thay đổi ở đây

    public ProjectService(UploadService uploadService,
            ProjectRepository projectRepository,
            ProductService productService,
            ServiceRepository serviceRepository) { // Thay đổi ở đây
        this.uploadService = uploadService;
        this.projectRepository = projectRepository;
        this.productService = productService;
        this.serviceRepository = serviceRepository; // Thay đổi ở đây
    }

    public Page<Project> getAllProjects(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("id").descending());
        return projectRepository.findAll(pageable);
    }

    public Project createProject(Project project, MultipartFile imageFile) throws IOException {
        // Xử lý Product - Cải thiện xử lý product ID
        if (project.getProduct() != null && project.getProduct().getId() > 0) {
            Long productId = project.getProduct().getId();
            Optional<Product> productOpt = productService.getProductById(productId);
            if (productOpt.isPresent()) {
                project.setProduct(productOpt.get());
            } else {
                // Thay vì ném ngoại lệ, chỉ ghi log và đặt product là null
                System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
                project.setProduct(null);
            }
        } else {
            // Đảm bảo đặt product là null nếu không có ID hợp lệ
            project.setProduct(null);
        }

        // Xử lý Service sử dụng serviceRepository trực tiếp
        if (project.getService() != null && project.getService().getId() > 0) {
            Long serviceId = project.getService().getId();
            Optional<vn.giaiphapthangmay.phantech.domain.Service> serviceOpt = serviceRepository.findById(serviceId); // Thay
                                                                                                                      // đổi
                                                                                                                      // ở
                                                                                                                      // đây
            if (serviceOpt.isPresent()) {
                project.setService(serviceOpt.get());
            } else {
                throw new RuntimeException("Không tìm thấy dịch vụ với ID: " + serviceId);
            }
        } else {
            project.setService(null);
        }

        // Xử lý file ảnh như bình thường
        if (imageFile != null && !imageFile.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile, "project");
            project.setImage(imagePath);
        }

        return projectRepository.save(project);
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public Project updatedProject(long id, Project project, MultipartFile imageFile) throws IOException {
        Optional<Project> existingOpt = projectRepository.findById(id);
        if (existingOpt.isPresent()) {
            Project existing = existingOpt.get();

            existing.setName(project.getName());
            existing.setDescription(project.getDescription());
            existing.setAddress(project.getAddress());
            existing.setFloor(project.getFloor());
            existing.setDate(project.getDate());
            // Xử lý Product - Cải thiện xử lý product ID
            if (project.getProduct() != null && project.getProduct().getId() > 0) {
                Long productId = project.getProduct().getId();
                Optional<Product> productOpt = productService.getProductById(productId);
                if (productOpt.isPresent()) {
                    existing.setProduct(productOpt.get());
                } else {
                    // Thay vì ném ngoại lệ, chỉ ghi log và giữ product hiện tại
                    System.out.println("Không tìm thấy sản phẩm với ID: " + productId);
                }
            } else {
                existing.setProduct(null);
            }

            // Xử lý Service sử dụng serviceRepository trực tiếp
            if (project.getService() != null && project.getService().getId() > 0) {
                Long serviceId = project.getService().getId();
                Optional<vn.giaiphapthangmay.phantech.domain.Service> serviceOpt = serviceRepository
                        .findById(serviceId); // Thay đổi ở đây
                if (serviceOpt.isPresent()) {
                    existing.setService(serviceOpt.get());
                } else {
                    throw new RuntimeException("Không tìm thấy dịch vụ với ID: " + serviceId);
                }
            } else {
                existing.setService(null);
            }

            if (imageFile != null && !imageFile.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile, "project");
                existing.setImage(imagePath);
            }
            return projectRepository.save(existing);
        }
        return null;
    }

    public Project getProjectById(long id) {
        return projectRepository.findById(id).orElse(null);
    }

    public void deleteProject(long id) {
        projectRepository.deleteById(id);
    }

    public Map<String, String> uploadImageForTinyMCE(MultipartFile file) throws IOException {
        String imagePath = uploadService.handleSaveUploadFile(file, "project");
        Map<String, String> response = new HashMap<>();
        response.put("location", "/images/project/" + imagePath);
        return response;
    }
}