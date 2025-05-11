package vn.giaiphapthangmay.phantech.service;

import java.util.stream.Collectors;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.criteria.Predicate;
import vn.giaiphapthangmay.phantech.domain.Product;

import vn.giaiphapthangmay.phantech.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final UploadService uploadService;

    public ProductService(ProductRepository productRepository, UploadService uploadService) {
        this.productRepository = productRepository;
        this.uploadService = uploadService;

    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    public Optional<Product> getProductById(long id) {
        return productRepository.findById(id);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product createProduct(Product product, MultipartFile imageFile1, MultipartFile imageFile2,
            MultipartFile imageFile3, MultipartFile imageFile4, MultipartFile imageFile5) throws IOException {

        // Xử lý các file ảnh
        if (!imageFile1.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile1, "product");
            product.setImage1(imagePath);
        }

        if (!imageFile2.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile2, "product");
            product.setImage2(imagePath);
        }

        if (!imageFile3.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile3, "product");
            product.setImage3(imagePath);
        }

        if (!imageFile4.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile4, "product");
            product.setImage4(imagePath);
        }

        if (!imageFile5.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile5, "product");
            product.setImage5(imagePath);
        }

        return productRepository.save(product);
    }

    public Product updateProduct(long id, Product product, MultipartFile imageFile1, MultipartFile imageFile2,
            MultipartFile imageFile3, MultipartFile imageFile4, MultipartFile imageFile5) throws IOException {

        Optional<Product> existingOpt = productRepository.findById(id);
        if (existingOpt.isPresent()) {
            Product existing = existingOpt.get();

            // Cập nhật các trường
            existing.setName(product.getName());
            existing.setSpeed(product.getSpeed());
            existing.setLoadCapacity(product.getLoadCapacity());
            existing.setDoorType(product.getDoorType());
            existing.setVideo(product.getVideo());
            existing.setControlTechnology(product.getControlTechnology());
            existing.setPitOrMachineRoom(product.getPitOrMachineRoom());
            existing.setPowerSupply(product.getPowerSupply());
            existing.setWarranty(product.getWarranty());
            existing.setDescription(product.getDescription());
            existing.setCabinSize(product.getCabinSize());
            existing.setDocumentation(product.getDocumentation());
            existing.setManufacturer(product.getManufacturer());
            existing.setElevatorType(product.getElevatorType());
            existing.setPrice(product.getPrice());
            existing.setShortDescription(product.getShortDescription());

            // Xử lý các file ảnh
            if (!imageFile1.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile1, "product");
                existing.setImage1(imagePath);
            }

            if (!imageFile2.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile2, "product");
                existing.setImage2(imagePath);
            }

            if (!imageFile3.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile3, "product");
                existing.setImage3(imagePath);
            }

            if (!imageFile4.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile4, "product");
                existing.setImage4(imagePath);
            }

            if (!imageFile5.isEmpty()) {
                String imagePath = uploadService.handleSaveUploadFile(imageFile5, "product");
                existing.setImage5(imagePath);
            }

            return productRepository.save(existing);
        }
        return null;
    }

    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

    public List<Map<String, Object>> searchProductsByName(String query) {
        if (query.length() < 2) {
            return Collections.emptyList();
        }

        List<Product> products = productRepository.findByNameContainingIgnoreCase(query);

        // Giới hạn kết quả để tránh quá tải
        List<Product> limitedResults = products.stream()
                .limit(10)
                .collect(Collectors.toList());

        return limitedResults.stream().map(product -> {
            Map<String, Object> result = new HashMap<>();
            result.put("id", product.getId());
            result.put("name", product.getName());
            return result;
        }).collect(Collectors.toList());
    }

    public Map<String, String> uploadImageForTinyMCE(MultipartFile file) throws IOException {
        return uploadService.uploadImageForTinyMCE(file, "product");
    }

    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    public Specification<Product> buildAdvancedFilterSpecification(
            String name,
            List<Long> elevatorTypeIds,
            List<Long> manufacturerIds,
            Long minPrice,
            Long maxPrice,
            Double minSpeed,
            Double maxSpeed,
            Long minLoadCapacity,
            Long maxLoadCapacity) {

        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            // 1. Lọc theo tên sản phẩm
            if (name != null && !name.isEmpty()) {
                predicates.add(criteriaBuilder.like(
                        criteriaBuilder.lower(root.get("name")),
                        "%" + name.toLowerCase() + "%"));
            }

            // 2. Lọc theo loại thang máy (có thể chọn nhiều)
            if (elevatorTypeIds != null && !elevatorTypeIds.isEmpty()) {
                predicates.add(root.get("elevatorType").get("id").in(elevatorTypeIds));
            }

            // 3. Lọc theo nhà sản xuất (có thể chọn nhiều)
            if (manufacturerIds != null && !manufacturerIds.isEmpty()) {
                predicates.add(root.get("manufacturer").get("id").in(manufacturerIds));
            }

            // 4. Lọc theo khoảng giá
            if (minPrice != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("price"), minPrice));
            }
            if (maxPrice != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("price"), maxPrice));
            }

            // 5. Lọc theo khoảng tốc độ
            if (minSpeed != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("speed"), minSpeed));
            }
            if (maxSpeed != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("speed"), maxSpeed));
            }

            // 6. Lọc theo khoảng tải trọng
            if (minLoadCapacity != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("loadCapacity"), minLoadCapacity));
            }
            if (maxLoadCapacity != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("loadCapacity"), maxLoadCapacity));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

    public Page<Product> getPageProductForClient(
            String name,
            List<Long> elevatorTypeIds,
            List<Long> manufacturerIds,
            Long minPrice,
            Long maxPrice,
            Double minSpeed,
            Double maxSpeed,
            Long minLoadCapacity,
            Long maxLoadCapacity,
            String sortBy,
            String sortDirection,
            int page) {

        Sort sort;

        switch (sortBy) {
            case "price":
                sort = "asc".equalsIgnoreCase(sortDirection)
                        ? Sort.by("price").ascending()
                        : Sort.by("price").descending();
                break;
            case "rating":
                sort = Sort.by("rating").descending(); // Điểm đánh giá cao nhất luôn giảm dần
                break;
            case "reviewCount":
                sort = Sort.by("reviewCount").descending(); // Điểm đánh giá cao nhất luôn giảm dần
                break;
            case "name":
                sort = Sort.by("name").ascending();
                break;
            default:
                sort = Sort.by("id").descending(); // Mặc định sắp xếp theo ID mới nhất
        }
        Pageable pageable = PageRequest.of(page - 1, 9, sort);

        // Thực hiện truy vấn với specification và phân trang
        return productRepository.findAll(
                buildAdvancedFilterSpecification(name, elevatorTypeIds, manufacturerIds,
                        minPrice, maxPrice, minSpeed, maxSpeed, minLoadCapacity, maxLoadCapacity),
                pageable);
    }

    public Page<Product> getPageProductForAdmin(
            String name,
            Pageable pageable) {
        return productRepository.findAll(
                buildAdvancedFilterSpecification(name, null, null,
                        null, null, null, null, null, null),
                pageable);
    }
}