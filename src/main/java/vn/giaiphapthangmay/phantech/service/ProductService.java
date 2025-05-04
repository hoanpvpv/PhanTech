package vn.giaiphapthangmay.phantech.service;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
        // Lưu file và lấy tên file
        String savedFileName = uploadService.handleSaveUploadFile(file, "product");

        // TinyMCE yêu cầu trả về JSON với thuộc tính "location" chứa URL của ảnh
        Map<String, String> response = new HashMap<>();
        response.put("location", "/images/product/" + savedFileName);

        return response;
    }

    public void saveProduct(Product product) {
        productRepository.save(product);
    }
}