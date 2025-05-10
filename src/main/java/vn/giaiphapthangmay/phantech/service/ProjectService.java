package vn.giaiphapthangmay.phantech.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.criteria.JoinType;
import jakarta.persistence.criteria.Predicate;
import vn.giaiphapthangmay.phantech.domain.Product;
import vn.giaiphapthangmay.phantech.domain.Product_;
import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.domain.Project_;
import vn.giaiphapthangmay.phantech.domain.Review;
import vn.giaiphapthangmay.phantech.domain.Service_;
import vn.giaiphapthangmay.phantech.repository.ProjectRepository;
import vn.giaiphapthangmay.phantech.repository.ServiceRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.method.P;

@Service
public class ProjectService {

    private final UploadService uploadService;
    private final ProjectRepository projectRepository;
    private final ProductService productService;
    private final ServiceService serviceService;

    public ProjectService(UploadService uploadService,
            ProjectRepository projectRepository,
            ProductService productService,
            ServiceService serviceService) {
        this.uploadService = uploadService;
        this.projectRepository = projectRepository;
        this.productService = productService;
        this.serviceService = serviceService;
    }

    public Project createProject(Project project, MultipartFile imageFile) throws IOException {
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

            if (imageFile != null && !imageFile.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile, "project");
                existing.setImage(imagePath);
            }
            return projectRepository.save(existing);
        }
        return null;
    }

    public List<Project> getNewProjectsByProductId(long productId) {
        Pageable pageable = PageRequest.of(0, 8, Sort.by("date").descending());
        return projectRepository.findByProductId(productId, pageable).getContent();
    }

    public Project getProjectById(long id) {
        return projectRepository.findById(id).orElse(null);
    }

    public void deleteProject(long id) {
        projectRepository.deleteById(id);
    }

    public Map<String, String> uploadImageForTinyMCE(MultipartFile file) throws IOException {
        // Sử dụng phương thức từ UploadService
        return this.uploadService.uploadImageForTinyMCE(file, "project");
    }

    public List<Project> getNewProjectsByServiceId(long id) {
        Pageable pageable = PageRequest.of(0, 8, Sort.by("date").descending());
        return projectRepository.findByServiceId(id, pageable).getContent();

    }

    public Specification<Project> buildClientFilterSpecification(
            String name,
            String address,
            String productName,
            Long serviceId) {

        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            // 1. Lọc theo tên dự án
            if (name != null && !name.isEmpty()) {
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.get(Project_.NAME)),
                        "%" + name.toLowerCase() + "%"));
            }

            // 2. Lọc theo địa chỉ
            if (address != null && !address.isEmpty()) {
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.get(Project_.ADDRESS)),
                        "%" + address.toLowerCase() + "%"));
            }

            if (productName != null && !productName.isEmpty()) {
                // 3. Lọc theo tên sản phẩm
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.join(Project_.PRODUCT, JoinType.LEFT).get(Product_.NAME)),
                        "%" + productName.toLowerCase() + "%"));

            }
            // 4. Lọc theo ID dịch vụ
            if (serviceId != null) {
                predicates.add(criteriaBuilder.equal(
                        root.join(Project_.SERVICE, JoinType.LEFT).get(Service_.ID),
                        serviceId));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

    public Page<Project> getPageProjectForClient(
            String name,
            String address,
            String productName,
            Long serviceId,
            Pageable pageable) {
        return projectRepository.findAll(
                buildClientFilterSpecification(name, address, productName, serviceId),
                pageable);
    }

    public Page<Project> getProjectsByPage(
            String name,
            String address,
            String productName,
            Long serviceId, // Thay đổi từ String serviceName
            LocalDate fromDate,
            LocalDate toDate,
            Pageable pageable) {

        return projectRepository.findAll(
                buildFilterByIdSpecification(name, address, productName, serviceId, fromDate, toDate),
                pageable);
    }

    // Thêm specification mới sử dụng serviceId
    private Specification<Project> buildFilterByIdSpecification(
            String name,
            String address,
            String productName,
            Long serviceId, // Thay đổi từ String serviceName
            LocalDate fromDate,
            LocalDate toDate) {

        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            // 1. Lọc theo tên dự án (giữ nguyên)
            if (name != null && !name.isEmpty()) {
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("name")),
                        "%" + name.toLowerCase() + "%"));
            }

            // 2. Lọc theo địa chỉ (giữ nguyên)
            if (address != null && !address.isEmpty()) {
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("address")),
                        "%" + address.toLowerCase() + "%"));
            }

            // 3. Lọc theo tên sản phẩm (giữ nguyên)
            if (productName != null && !productName.isEmpty()) {
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.join("product", JoinType.LEFT).get("name")),
                        "%" + productName.toLowerCase() + "%"));
            }

            // 4. Lọc theo ID dịch vụ (thay đổi)
            if (serviceId != null) {
                // Lọc theo ID dịch vụ (so sánh chính xác)
                predicates.add(criteriaBuilder.equal(
                        root.join("service", JoinType.LEFT).get("id"),
                        serviceId));
            }

            // 5. Lọc theo khoảng thời gian (giữ nguyên)
            if (fromDate != null && toDate != null) {
                predicates.add(criteriaBuilder.between(root.get("date"), fromDate, toDate));
            } else if (fromDate != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("date"), fromDate));
            } else if (toDate != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("date"), toDate));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

    public Page<Project> getAllProjectsByPage(Pageable pageable) {
        return projectRepository.findAll(pageable);
    }
}