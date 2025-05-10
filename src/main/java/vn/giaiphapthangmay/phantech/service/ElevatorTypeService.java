package vn.giaiphapthangmay.phantech.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.ElevatorType;
import vn.giaiphapthangmay.phantech.domain.ElevatorType_;
import vn.giaiphapthangmay.phantech.repository.ElevatorTypeRepository;

@Service
public class ElevatorTypeService {
    private final ElevatorTypeRepository elevatorTypeRepository;
    private final UploadService uploadService;

    public ElevatorTypeService(ElevatorTypeRepository elevatorTypeRepository, UploadService uploadService) {
        this.elevatorTypeRepository = elevatorTypeRepository;
        this.uploadService = uploadService;
    }

    private Specification<ElevatorType> nameLike(String name) {
        return (root, query, criteriaBuilder) -> {
            if (name == null || name.isEmpty()) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.or(
                    criteriaBuilder.like(root.get(ElevatorType_.NAME), "%" + name + "%"));
        };
    }

    public Page<ElevatorType> getPageElevatorTypeByName(String name, Pageable pageable) {
        return this.elevatorTypeRepository.findAll(nameLike(name), pageable);
    }

    public List<ElevatorType> getAllElevatorType() {
        return elevatorTypeRepository.findAll();
    }

    public Page<ElevatorType> getAllElevatorType(Pageable pageable) {
        return elevatorTypeRepository.findAll(pageable);
    }

    public ElevatorType getElevatorTypeById(long id) {
        return elevatorTypeRepository.findById(id).orElse(null);
    }

    public void saveElevatorType(ElevatorType elevatorType, MultipartFile imageFile) {
        if (!imageFile.isEmpty()) {
            String imagePath = uploadService.handleSaveUploadFile(imageFile, "public");
            elevatorType.setImage(imagePath);
        }
        this.elevatorTypeRepository.save(elevatorType);
    }

    public void deleteElevatorType(long id) {
        ElevatorType elevatorType = elevatorTypeRepository.findById(id).orElse(null);
        if (elevatorType != null) {
            this.elevatorTypeRepository.delete(elevatorType);
        }
    }
}
